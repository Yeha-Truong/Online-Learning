import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter_app/views/utils/messages.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../utils/spacer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserProvider _userProvider;
  File? _image = null;
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _upload(context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    );
    UserBloc bloc = UserBloc();
    bloc.uploadAvatar(File(image!.path));
    bloc.stream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          OLMessage.showLinearDialog(context);
          break;
        case Status.COMPLETED:
          Navigator.of(context, rootNavigator: true).pop();
          break;
        case Status.ERROR:
          Navigator.of(context, rootNavigator: true).pop();
          OLMessage.showStatusDialog(
            context,
            DialogType.ERROR,
            event.message.toString(),
            () => {},
          );
          break;
        default:
          break;
      }
    });
  }

  void _update(context) {
    final FormState? state = _formKey.currentState;
    if (state!.validate()) {
      UserBloc bloc = UserBloc();
      bloc.update(
          _name.text, _phone.text, _userProvider.user.avatar.toString());
      bloc.stream.listen((event) async {
        switch (event.status) {
          case Status.LOADING:
            OLMessage.showLinearDialog(context);
            break;
          case Status.COMPLETED:
            _userProvider.user = event.data;
            await Provider.of<UserProvider>(context, listen: false)
                .saveUser(event.data, UserType.System);
            Navigator.of(context, rootNavigator: true).pop();
            OLMessage.showStatusDialog(
              context,
              DialogType.SUCCES,
              'Update successfully',
              () => {},
            );
            break;
          case Status.ERROR:
            Navigator.of(context, rootNavigator: true).pop();
            OLMessage.showStatusDialog(
              context,
              DialogType.ERROR,
              event.message.toString(),
              () => {},
            );
            break;
          default:
            break;
        }
      });
    }
  }

  @override
  didChangeDependencies() {
    _userProvider = Provider.of<UserProvider>(context, listen: true);
    _name.text = _userProvider.user.name != null
        ? _userProvider.user.name.toString()
        : '';
    _phone.text = _userProvider.user.phone != null
        ? _userProvider.user.phone.toString()
        : '';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        leadingWidth: 100.0,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _image != null
                  ? Image.file(_image!)
                  : CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                        child: _userProvider.user.avatar != null
                            ? Image.network(
                                _userProvider.user.avatar.toString())
                            : Image(
                                image:
                                    AssetImage('assets/default/takodachi.png')),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      radius: 80.0,
                    ),
              ElevatedButton(
                onPressed: () => _upload(context),
                child: Text(
                  'Change image',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              VerticalSpacer(distance: 16.0),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Name'),
                          ),
                          VerticalSpacer(distance: 8.0),
                          TextFormField(
                            controller: _name,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              fillColor: Theme.of(context).primaryColor,
                              filled: true,
                              hintText: _userProvider.user.name != null
                                  ? _userProvider.user.name
                                  : '',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 0.0,
                              ),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Name cannot be empty!' : null,
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacer(distance: 16.0),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Phone'),
                          ),
                          VerticalSpacer(distance: 8.0),
                          TextFormField(
                            controller: _phone,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              fillColor: Theme.of(context).primaryColor,
                              filled: true,
                              hintText: _userProvider.user.phone != null
                                  ? _userProvider.user.phone
                                  : '',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 0.0,
                              ),
                            ),
                            validator: (value) =>
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                        .hasMatch(value.toString())
                                    ? 'Invalid phone number'
                                    : null,
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacer(distance: 16.0),
                    Container(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: ElevatedButton(
                          autofocus: true,
                          child: Text('Update'),
                          onPressed: () => _update(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter_app/views/utils/messages.dart';
import 'package:provider/provider.dart';
import '../utils/spacer.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _obscure = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _cancel(context) {
    Navigator.pop(context);
  }

  void _showPassword() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  void _signin(context) {
    final FormState? state = _formKey.currentState;
    if (state!.validate()) {
      UserBloc bloc = UserBloc();
      bloc.login(_email.text, _password.text);
      bloc.userStream.listen((event) async {
        switch (event.status) {
          case Status.LOADING:
            OLMessage.showLinearDialog(context);
            break;
          case Status.COMPLETED:
            Navigator.of(context, rootNavigator: true).pop();
            await Provider.of<UserProvider>(context, listen: false)
                .saveUser(event.data);
            Navigator.pushNamed(context, '/');
            break;
          case Status.ERROR:
            Navigator.of(context, rootNavigator: true).pop();
            OLMessage.showStatusDialog(
              context,
              DialogType.INFO,
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

  void _help(context) {
    Navigator.pushNamed(context, '/support');
  }

  void _sso() {}

  void _subscribe(context) {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => _cancel(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        leadingWidth: 200.0,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                            child: Text('Email'),
                          ),
                          VerticalSpacer(distance: 8.0),
                          TextFormField(
                            controller: _email,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Theme.of(context).primaryColor,
                              filled: true,
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
                            child: Text('Password'),
                          ),
                          VerticalSpacer(distance: 8.0),
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              TextFormField(
                                controller: _password,
                                textInputAction: TextInputAction.done,
                                obscureText: _obscure,
                                decoration: InputDecoration(
                                  fillColor: Theme.of(context).primaryColor,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 0.0,
                                  ),
                                  prefixIcon: GestureDetector(
                                    dragStartBehavior: DragStartBehavior.down,
                                    onTap: () => {},
                                    child: Icon(
                                      !_obscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? 'Password cannot be empty!'
                                    : null,
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  dragStartBehavior: DragStartBehavior.down,
                                  onTap: _showPassword,
                                  child: Icon(
                                    !_obscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ],
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
                          child: Text('Sign in'),
                          onPressed: () => _signin(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: TextButton(
                    child: Text('Need help?'),
                    onPressed: () => _help(context),
                  ),
                ),
              ),
              Container(
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: OutlinedButton(
                    child: Text('Use Single Sign-On (SSO)'),
                    onPressed: _sso,
                  ),
                ),
              ),
              Container(
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: OutlinedButton(
                    child: Text('Subscribe to OnlineLearning'),
                    onPressed: () => _subscribe(context),
                  ),
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

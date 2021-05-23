import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/views/utils/messages.dart';
import '../utils/spacer.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit(context) {
    final FormState? state = _formKey.currentState;
    if (state!.validate()) {
      UserBloc bloc = UserBloc();
      bloc.forgotPassword(_email.text);
      bloc.stream.listen((event) async {
        switch (event.status) {
          case Status.LOADING:
            OLMessage.showLinearDialog(context);
            break;
          case Status.COMPLETED:
            Navigator.of(context, rootNavigator: true).pop();
            OLMessage.showStatusDialog(context, DialogType.SUCCES,
                'Check your email to get URL for changing password', () => {});
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
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
                            textInputAction: TextInputAction.done,
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
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: ElevatedButton(
                          autofocus: true,
                          child: Text('Submit'),
                          onPressed: () => _submit(context),
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

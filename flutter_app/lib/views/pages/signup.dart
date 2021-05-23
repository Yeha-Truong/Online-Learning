import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter_app/views/utils/messages.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _cancel(context) {
    Navigator.pop(context);
  }

  void _showPassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _showConfirm() {
    setState(() {
      _obscureConfirm = !_obscureConfirm;
    });
  }

  void _signin(context) {
    Navigator.pushReplacementNamed(context, '/signin');
  }

  void _help(context) {
    Navigator.pushNamed(context, '/support');
  }

  Future<void> _google() async {
    GoogleSignIn google = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );
    await google.signIn().then((value) {
      if (value != null) {
        UserBloc bloc = UserBloc();
        bloc.google(value.email, value.id);
        bloc.stream.listen((event) async {
          switch (event.status) {
            case Status.LOADING:
              OLMessage.showLinearDialog(context);
              break;
            case Status.COMPLETED:
              Navigator.of(context, rootNavigator: true).pop();
              await Provider.of<UserProvider>(context, listen: false)
                  .saveUser(event.data, UserType.Google);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
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
    });
  }

  void _signup(context) {
    final FormState? state = _formKey.currentState;
    if (state!.validate()) {
      UserBloc bloc = UserBloc();
      bloc.register(_email.text, _name.text, _phone.text, _password.text);
      bloc.stream.listen((event) {
        switch (event.status) {
          case Status.LOADING:
            OLMessage.showLinearDialog(context);
            break;
          case Status.COMPLETED:
            Navigator.of(context, rootNavigator: true).pop();
            OLMessage.showStatusDialog(
              context,
              DialogType.SUCCES,
              'Register successfully!\nVerify your email before signing in.',
              () => Navigator.pushReplacementNamed(context, '/signin'),
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
      //Navigator.pushNamed(context, '/signin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign up'),
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
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
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
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email address!",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Name'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          controller: _name,
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
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Phone'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          controller: _phone,
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
                              !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                      .hasMatch(value.toString())
                                  ? 'Invalid phone number'
                                  : null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Password'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            TextFormField(
                              controller: _password,
                              textInputAction: TextInputAction.next,
                              obscureText: _obscurePassword,
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
                                    _obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
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
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Confirm password'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            TextFormField(
                              controller: _confirm,
                              textInputAction: TextInputAction.done,
                              obscureText: _obscureConfirm,
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
                                    _obscureConfirm
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (value) =>
                                  value!.isEmpty || value != _password.text
                                      ? 'Passwords do not match!'
                                      : null,
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: GestureDetector(
                                dragStartBehavior: DragStartBehavior.down,
                                onTap: _showConfirm,
                                child: Icon(
                                  _obscureConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                        autofocus: true,
                        child: Text('Sign up'),
                        onPressed: () => _signup(context),
                      ),
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
                        child: Text('Sign in with Google'),
                        onPressed: _google,
                      ),
                    ),
                  ),
                  Container(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: OutlinedButton(
                        child: Text('Sign in to OnLearn'),
                        onPressed: () => _signin(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

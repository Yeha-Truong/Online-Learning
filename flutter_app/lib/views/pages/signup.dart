import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool hidden = true;
  TextEditingController _email = TextEditingController();
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
      hidden = !hidden;
    });
  }

  void _signin(context) {
    Navigator.pushNamed(context, '/signin');
  }

  void _help(context) {
    Navigator.pushNamed(context, '/support');
  }

  void _sso() {}

  void _signup(context) {
    final FormState? state = _formKey.currentState;
    if (state!.validate()) {
      Navigator.pushNamed(context, '/signin');
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
          child: Form(
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
                          fillColor: Colors.blueGrey[900],
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
                        child: Text('Password'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: _password,
                        textInputAction: TextInputAction.next,
                        obscureText: hidden,
                        decoration: InputDecoration(
                          fillColor: Colors.blueGrey[900],
                          filled: true,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 0.0,
                          ),
                          prefixIcon: GestureDetector(
                            dragStartBehavior: DragStartBehavior.down,
                            onTap: _showPassword,
                            child: Icon(Icons.visibility_off),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Password cannot be empty!' : null,
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
                      TextFormField(
                        controller: _confirm,
                        textInputAction: TextInputAction.done,
                        obscureText: hidden,
                        decoration: InputDecoration(
                          fillColor: Colors.blueGrey[900],
                          filled: true,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 0.0,
                          ),
                          prefixIcon: GestureDetector(
                            dragStartBehavior: DragStartBehavior.down,
                            onTap: _showPassword,
                            child: Icon(Icons.visibility_off),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty || value != _password.text
                                ? 'Passwords do not match!'
                                : null,
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
                      child: Text('Use Single Sign-On (SSO)'),
                      onPressed: _sso,
                    ),
                  ),
                ),
                Container(
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: OutlinedButton(
                      child: Text('Sign in to Pluralsight'),
                      onPressed: () => _signin(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

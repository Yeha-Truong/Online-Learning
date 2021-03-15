import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/spaces.dart';

class SigninPage extends StatelessWidget {
  void _cancel(context) {
    Navigator.pop(context);
  }

  void _showPassword() {}
  void _signin(context) {
    Navigator.pushNamed(context, '/home');
  }

  void _help(context) {
    Navigator.pushNamed(context, '/support');
  }

  void _sso() {}
  void _subscribe() {}

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
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email or username'),
                    ),
                    VerticalSpace_S(),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 0.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpace_M(),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password'),
                    ),
                    VerticalSpace_S(),
                    TextFormField(
                      decoration: InputDecoration(
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
                    ),
                  ],
                ),
              ),
              VerticalSpace_M(),
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
                    child: Text('Subscribe to PluralSight'),
                    onPressed: _subscribe,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

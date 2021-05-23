import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter_app/views/utils/messages.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _obscureCurrent = true;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  TextEditingController _current = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _current.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _showCurrent() {
    setState(() {
      _obscureCurrent = !_obscureCurrent;
    });
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

  void _submit(context) {
    final FormState? state = _formKey.currentState;
    if (state!.validate()) {
      UserBloc bloc = UserBloc();

      bloc.changePassword(
          Provider.of<UserProvider>(context, listen: false)
              .user
              .email
              .toString(),
          _current.text,
          _confirm.text);
      bloc.stream.listen((event) async {
        switch (event.status) {
          case Status.LOADING:
            OLMessage.showLinearDialog(context);
            break;
          case Status.COMPLETED:
            Navigator.of(context, rootNavigator: true).pop();
            OLMessage.showStatusDialog(
              context,
              DialogType.SUCCES,
              "Change password successfully",
              () => {},
            );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Change Password'),
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
                          child: Text('Current password'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            TextFormField(
                              controller: _current,
                              textInputAction: TextInputAction.next,
                              obscureText: _obscureCurrent,
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
                                    _obscureCurrent
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
                                onTap: _showCurrent,
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
                        child: Text('Submit'),
                        onPressed: () => _submit(context),
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

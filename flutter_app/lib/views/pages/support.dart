import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  void _signin(context) {
    Navigator.pop(context);
  }

  void _forgot() {}
  void _subscribe() {}
  void _restore() {}
  void _contact() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    size: 32.0,
                  ),
                  Text('Sign in'),
                ],
              ),
              onTap: () => _signin(context),
            ),
          ),
        ),
        leadingWidth: 400.0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  title: Text('Forgot your password'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: _forgot,
                ),
                ListTile(
                  title: Text('Subscribe to Pluralsight'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: _subscribe,
                ),
                ListTile(
                  title: Text('Restore subscription with iTunes'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: _restore,
                ),
                ListTile(
                  title: Text('Contact Pluralsight support'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: _contact,
                ),
              ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}

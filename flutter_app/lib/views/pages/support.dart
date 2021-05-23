import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
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
                  Text('Cancel'),
                ],
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ),
        leadingWidth: 400.0,
        automaticallyImplyLeading: false,
        title: Text('Support'),
        centerTitle: true,
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
                  onTap: () => Navigator.pushNamed(context, '/forgot'),
                ),
                ListTile(
                  title: Text('Subscribe to OnLearn'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                ),
              ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}

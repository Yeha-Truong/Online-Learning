import 'package:flutter/material.dart';
import 'package:flutter_app/views/utils/spacer.dart';

class ManagementFragment extends StatefulWidget {
  @override
  _ManagementFragmentState createState() => _ManagementFragmentState();
}

class _ManagementFragmentState extends State<ManagementFragment> {
  bool _stream = false;

  bool _download = true;

  void _onSwitchStream(value) {
    setState(() {
      _stream = value;
    });
  }

  void _onSwitchDownload(value) {
    setState(() {
      _download = value;
    });
  }

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
                  Text('Home'),
                ],
              ),
              onTap: () => Navigator.pop(context),
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
                  title: Text(
                    'Account',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => {},
                ),
                ListTile(
                  title: Text(
                    'Subscription',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    'Invidual (Expires: May 1, 2020)',
                    style: Theme.of(context).textTheme.overline,
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => {},
                ),
                ListTile(
                  title: Text(
                    'Theme',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Theme.of(context).brightness == Brightness.dark
                            ? 'Dark'
                            : 'Light',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                  onTap: () => Navigator.pushNamed(context, '/theme'),
                ),
                ListTile(
                  title: Text(
                    'Require Wi-Fi for streaming',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Switch(
                    value: _stream,
                    activeColor: Colors.lightBlue,
                    onChanged: (value) => _onSwitchStream(value),
                  ),
                  onTap: () => {},
                ),
                ListTile(
                  title: Text(
                    'Require Wi-Fi for downloading',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Switch(
                    value: _download,
                    activeColor: Colors.lightBlue,
                    onChanged: (value) => _onSwitchDownload(value),
                  ),
                  onTap: () => {},
                ),
                ListTile(
                  title: Text(
                    'Send feedback',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => {},
                ),
                ListTile(
                  title: Text(
                    'Contact support',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => {},
                ),
                ListTile(
                  title: Text(
                    'App version',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Text(
                    '2.76.2479',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onTap: () => {},
                ),
                VerticalSpacer(distance: 32.0),
                OutlinedButton(
                  onPressed: () => Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil('/welcome', (route) => false),
                  child: Text(
                    'Sign out',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}

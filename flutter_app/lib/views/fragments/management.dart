import 'package:flutter/material.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:provider/provider.dart';

class ManagementFragment extends StatefulWidget {
  @override
  _ManagementFragmentState createState() => _ManagementFragmentState();
}

class _ManagementFragmentState extends State<ManagementFragment> {
  late UserProvider _userProvider;

  Future<void> _signout() async {
    await _userProvider.deactiveUser();
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil('/welcome', (route) => false);
  }

  @override
  didChangeDependencies() {
    _userProvider = Provider.of<UserProvider>(context, listen: true);
    super.didChangeDependencies();
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
                if (_userProvider.user.id != null)
                  ListTile(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => {},
                  ),
                if (_userProvider.type == UserType.System)
                  ListTile(
                    title: Text(
                      'Change password',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => Navigator.pushNamed(context, '/change'),
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
                    '1.0',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onTap: () => {},
                ),
                VerticalSpacer(distance: 32.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  child: OutlinedButton(
                    onPressed: _signout,
                    child: Text(
                      _userProvider.user.id != null ? 'Sign out' : 'Sign in',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
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

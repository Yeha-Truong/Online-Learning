import 'package:flutter/material.dart';
import 'package:flutter_app/provider/theme.dart';
import 'package:provider/provider.dart';

class ThemeFragment extends StatefulWidget {
  @override
  _ThemeFragmentState createState() => _ThemeFragmentState();
}

class _ThemeFragmentState extends State<ThemeFragment> {
  void _cancel(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

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
                  Text('Back'),
                ],
              ),
              onTap: () => _cancel(context),
            ),
          ),
        ),
        title: Text('Theme'),
        centerTitle: true,
        leadingWidth: 200.0,
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
                    'System',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: theme.currentTheme == ThemeMode.system
                      ? Icon(Icons.check)
                      : null,
                  onTap: () => theme.changeTheme(ThemeMode.system),
                ),
                ListTile(
                  title: Text(
                    'Light',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: theme.currentTheme == ThemeMode.light
                      ? Icon(Icons.check)
                      : null,
                  onTap: () => theme.changeTheme(ThemeMode.light),
                ),
                ListTile(
                  title: Text(
                    'Dark',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: theme.currentTheme == ThemeMode.dark
                      ? Icon(Icons.check)
                      : null,
                  onTap: () => theme.changeTheme(ThemeMode.dark),
                ),
              ],
            ).toList(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/views/fragments/course_list_fragment.dart';
import 'package:flutter_app/views/fragments/home_fragment.dart';
import 'package:flutter_app/views/pages/management.dart';

class Routes {
  static const String root = '/';
  static const String courses = '/courses';
  static const String management = '/management';
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _key.currentState!.maybePop(),
      child: Navigator(
        key: _key,
        initialRoute: Routes.root,
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case Routes.root:
              builder = (_) => HomeFragment();
              break;
            case Routes.courses:
              builder = (_) => CourseListFragment();
              break;
            case Routes.management:
              builder = (_) => ManagementPage();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}

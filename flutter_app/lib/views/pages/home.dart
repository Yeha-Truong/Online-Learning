import 'package:flutter/material.dart';
import 'package:flutter_app/views/fragments/courses.dart';
import 'package:flutter_app/views/fragments/home.dart';
import 'package:flutter_app/views/fragments/management.dart';
import 'package:flutter_app/views/fragments/statistic.dart';
import 'package:flutter_app/views/fragments/theme.dart';
import 'package:flutter_app/views/pages/change_password.dart';

class Routes {
  static const String root = '/';
  static const String courses = '/courses';
  static const String management = '/management';
  static const String theme = '/theme';
  static const String statistic = '/statistic';
  static const String change = '/change';
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
              builder = (_) => ManagementFragment();
              break;
            case Routes.statistic:
              builder = (_) => StatisticFragment();
              break;
            case Routes.theme:
              builder = (_) => ThemeFragment();
              break;
            case Routes.change:
              builder = (_) => ChangePasswordPage();
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

import 'package:flutter/material.dart';
import 'package:flutter_app/provider/theme.dart';
import 'package:flutter_app/views/pages/review.dart';
import 'package:flutter_app/views/pages/course.dart';
import 'package:flutter_app/views/pages/centre.dart';
import 'package:flutter_app/views/pages/signin.dart';
import 'package:flutter_app/views/pages/signup.dart';
import 'package:flutter_app/views/pages/support.dart';
import 'package:flutter_app/views/pages/welcome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final theme = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'Online Learning',
          themeMode: theme.themeMode,
          theme: OLTheme.lightTheme,
          darkTheme: OLTheme.darkTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => CentrePage(),
            '/welcome': (context) => WelcomePage(),
            '/signin': (context) => SigninPage(),
            '/signup': (context) => SignupPage(),
            '/support': (context) => SupportPage(),
            '/course': (context) => CoursePage(),
            '/review': (context) => ReviewPage(),
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'views/pages/welcome.dart';
import 'views/pages/signin.dart';
import 'views/pages/support.dart';
import 'views/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Learning',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Colors.black12,
        ),

        // Define the default font family.

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/signin': (context) => SigninPage(),
        '/support': (context) => SupportPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

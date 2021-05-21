import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  ThemeMode get currentTheme {
    return themeMode;
  }

  void changeTheme(ThemeMode value) {
    if (themeMode != value) {
      themeMode = value;
      notifyListeners();
    }
  }
}

class OLTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark().copyWith(
      primary: Colors.lightBlue,
      secondary: Colors.white,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1.0,
          color: Colors.lightBlue,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        textStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.black,
    ),
    cardColor: Color.fromRGBO(44, 49, 55, 1),
    primaryColor: Color.fromRGBO(44, 49, 55, 1),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1.0,
          color: Colors.purple,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;


  bool get isDark => themeMode == ThemeMode.dark;
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black12,
    primaryColor: Colors.black12,
   //colorScheme: ColorScheme.dark(),
  );

  static final lighTheme = ThemeData(
    scaffoldBackgroundColor: Colors.deepOrangeAccent,
      primaryColor: Colors.deepOrangeAccent,
    //colorScheme: ColorScheme.dark(),
  );
}

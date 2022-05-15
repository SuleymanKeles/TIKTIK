import 'package:flutter/material.dart';
import 'package:html/dom.dart';

class MyThemes {
  static const primaryColor = Color.fromRGBO(245, 0, 87, 1);
  static const secondaryColor = Color.fromRGBO(249, 187, 208, 1.0);
  static const situationDone = Color.fromRGBO(0, 191, 165, 1);
  static const situationWait = Color.fromRGBO(140, 158, 255, 1);
  static const situationExit = Color.fromRGBO(255, 61, 0, 1);
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
        primary: primaryColor,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        secondary: secondaryColor),
    dividerColor: Colors.black,
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white,),
  );
}

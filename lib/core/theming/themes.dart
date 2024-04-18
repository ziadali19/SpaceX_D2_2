import 'package:flutter/material.dart';

class Themes {
  static Themes themes = Themes._();

  Themes._();

  static Themes get instance => themes;

  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Roboto',
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }
}

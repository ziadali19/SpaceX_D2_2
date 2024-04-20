import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spacex_d2_2/core/theming/styles.dart';

class Themes {
  static Themes themes = Themes._();

  Themes._();

  static Themes get instance => themes;

  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle:
            TextStyles.font24White500.copyWith(fontFamily: 'RobotoCondensed'),
      ),
      colorScheme: const ColorScheme.light(primary: Colors.black),
      fontFamily: 'RobotoCondensed',
      useMaterial3: true,
      brightness: Brightness.light,
    );
  }
}

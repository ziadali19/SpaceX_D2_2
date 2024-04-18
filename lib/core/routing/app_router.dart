// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:spacex_d2_2/core/routing/routes.dart';

class AppRouter {
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const Scaffold());
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}

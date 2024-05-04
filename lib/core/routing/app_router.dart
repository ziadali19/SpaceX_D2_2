// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:spacex_d2_2/core/routing/routes.dart';
import 'package:spacex_d2_2/features/landing/presentation/screens/landing_screen.dart';
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/hacker_video_view.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_details.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_screen.dart';

class AppRouter {
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case Routes.luanches:
        return MaterialPageRoute(
            builder: (context) => DetailView(
                  luanchModel: arguments as LuanchModel,
                ));

      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}

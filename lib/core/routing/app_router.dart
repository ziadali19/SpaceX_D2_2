// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:spacex_d2_2/core/routing/routes.dart';
import 'package:spacex_d2_2/features/landing/presentation/screens/landing_screen.dart';
<<<<<<< feature/Lunach
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/hacker_video_view.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_details.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_screen.dart';
=======
import 'package:spacex_d2_2/features/rockets/data/models/rockets_model.dart';
import 'package:spacex_d2_2/features/rockets/presentation/screens/rocket_details_screen.dart';
>>>>>>> main

class AppRouter {
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
<<<<<<< feature/Lunach
      case Routes.luanches:
        return MaterialPageRoute(
            builder: (context) => DetailView(
                  luanchModel: arguments as LuanchModel,
                ));

=======
      case Routes.rocketDetails:
        return MaterialPageRoute(
            builder: (context) => RocketDetailsScreen(
                  rocket: arguments as Rocket,
                ));
>>>>>>> main
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}

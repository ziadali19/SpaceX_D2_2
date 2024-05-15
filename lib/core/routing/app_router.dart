// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:spacex_d2_2/core/routing/routes.dart';
import 'package:spacex_d2_2/features/dragons/data/models/dragons_model.dart';
import 'package:spacex_d2_2/features/dragons/presentation/screens/dragons_details_screen.dart';
import 'package:spacex_d2_2/features/dragons/presentation/screens/dragons_screen.dart';
import 'package:spacex_d2_2/features/landing/presentation/screens/landing_screen.dart';
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/hacker_video_view.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_details.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_screen.dart';
import 'package:spacex_d2_2/features/rockets/data/models/rockets_model.dart';
import 'package:spacex_d2_2/features/rockets/presentation/screens/rocket_details_screen.dart';

class AppRouter {
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case Routes.luanches:
        return MaterialPageRoute(
            builder: (context) => LaunchesScreen(
                  luanchModel: arguments as LuanchModel,
                ));
      case Routes.luanches_details_Screen:
        return MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (context) => DetailView(
                  luanchModel: arguments as LuanchModel,
                ));
      case Routes.luanches_video_Screen:
        return MaterialPageRoute(builder: (context) => const HackerVideoView());

      case Routes.rocketDetails:
        return MaterialPageRoute(
            builder: (context) => RocketDetailsScreen(
                  rocket: arguments as Rocket,
                ));
      case Routes.DragonsScreen:
        return MaterialPageRoute(builder: (context) => const DragonsScreen());
      case Routes.DragonsScreen_Details:
        return MaterialPageRoute(
            builder: (context) => DragonDetailsScreen(
                  dragons: arguments as Dragons,
                ));
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}

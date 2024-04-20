import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex_d2_2/core/theming/themes.dart';

import 'core/routing/app_router.dart';
import 'core/utils/constants.dart';
import 'features/landing/presentation/screens/landing_screen.dart';
import 'features/on_boarding/presentation/screens/on_boarding_screen.dart';

class SpaceXApp extends StatelessWidget {
  const SpaceXApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(500, 600),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: AppConstants.onBoarding != true
              ? const OnBoardingScreen()
              : const LandingScreen(),
          onGenerateRoute: (settings) {
            return AppRouter.onGenerateRoute(settings);
          },
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);

            return MediaQuery(
              data: mediaQueryData.copyWith(
                  textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          theme: Themes.instance.lightTheme(context),
        );
      },
    );
  }
}

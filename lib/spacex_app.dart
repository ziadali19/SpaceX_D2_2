import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

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
          home: const Scaffold(),
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
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_d2_2/spacex_app.dart';

import 'core/helpers/bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'core/services/shared_perferences.dart';
import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();
  await CacheHelper.instance.init();
  AppConstants.onBoarding = CacheHelper.instance.getData('onBoarding') as bool?;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  runApp(const SpaceXApp());
}

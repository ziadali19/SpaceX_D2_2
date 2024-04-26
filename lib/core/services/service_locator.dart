import 'package:get_it/get_it.dart';
import 'package:spacex_d2_2/core/network/dio_helper.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    //sl.registerLazySingleton<BaseLaunchesRepository>()=>LaunchesRepository(DioHelper:DioHelper.instance);
  }
}

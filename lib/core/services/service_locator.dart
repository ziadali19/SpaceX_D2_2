import 'package:get_it/get_it.dart';
import 'package:spacex_d2_2/features/launches/controller/cubit/luanches_cubit.dart';
import 'package:spacex_d2_2/features/launches/data/repository/launches_repository.dart';

import '../network/dio_helper.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerFactory<LuanchesCubit>(() => LuanchesCubit(sl()));
    sl.registerLazySingleton<BaseLunachesRepository>(
        () => LunachesRepository(DioHelper.instance));
  }
}

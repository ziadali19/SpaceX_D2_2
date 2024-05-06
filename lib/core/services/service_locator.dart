import 'package:get_it/get_it.dart';

import '../network/dio_helper.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static void init() {
<<<<<<< feature/Lunach
    sl.registerFactory<LuanchesCubit>(() => LuanchesCubit(sl()));
    sl.registerLazySingleton<BaseLunachesRepository>(
        () => LunachesRepository(DioHelper.instance));
=======
    sl.registerFactory<RocketsCubit>(() => RocketsCubit(sl()));
    sl.registerLazySingleton<BaseRocketsRepository>(
        () => RocketsRepository(DioHelper.instance));
>>>>>>> main
  }
}

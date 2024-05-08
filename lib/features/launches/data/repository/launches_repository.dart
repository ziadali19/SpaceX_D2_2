import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex_d2_2/core/network/api_error_handler.dart';
import 'package:spacex_d2_2/core/network/dio_helper.dart';
import 'package:spacex_d2_2/core/network/failure.dart';
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';

abstract class BaseLunachesRepository {
  Future<Either<ApiErrorModel, List<LuanchModel>>> getLunaches();
}

class LunachesRepository implements BaseLunachesRepository {
  final DioHelper dioHelper;

  LunachesRepository(this.dioHelper);
  @override
  Future<Either<ApiErrorModel, List<LuanchModel>>> getLunaches() async {
    try {
      Response response = await dioHelper.get('/v4/launches');

      return Right((response.data as List)
          .map<LuanchModel>((e) => LuanchModel.fromJson(e))
          .toList());
    } on DioException catch (e) {
      ApiErrorModel apiErrorModel = ErrorHandler.instance.handleError(e);
      return Left(apiErrorModel);
    }
  }
}

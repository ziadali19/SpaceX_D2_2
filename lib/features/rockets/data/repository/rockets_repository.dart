import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex_d2_2/core/network/api_error_handler.dart';
import 'package:spacex_d2_2/core/network/dio_helper.dart';
import 'package:spacex_d2_2/core/network/failure.dart';

import '../models/rockets_model.dart';

abstract class BaseRocketsRepository {
  Future<Either<ApiErrorModel, List<Rocket>>> getRockets();
}

class RocketsRepository implements BaseRocketsRepository {
  final DioHelper dioHelper;

  RocketsRepository(this.dioHelper);
  @override
  Future<Either<ApiErrorModel, List<Rocket>>> getRockets() async {
    try {
      Response response = await dioHelper.get('v4/rockets');

      return Right((response.data as List)
          .map<Rocket>((e) => Rocket.fromJson(e))
          .toList());
    } on DioException catch (e) {
      ApiErrorModel apiErrorModel = ErrorHandler.instance.handleError(e);
      return Left(apiErrorModel);
    }
  }
}

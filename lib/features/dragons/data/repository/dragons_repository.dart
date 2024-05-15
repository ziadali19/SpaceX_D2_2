import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex_d2_2/core/network/api_error_handler.dart';
import 'package:spacex_d2_2/core/network/dio_helper.dart';
import 'package:spacex_d2_2/core/network/failure.dart';

import '../models/dragons_model.dart';

abstract class BaseDragonsRepository {
  // ignore: non_constant_identifier_names
  Future<Either<ApiErrorModel, List<Dragons>>> Get_all_Dragons();
}

class DragonsRepository implements BaseDragonsRepository {
  final DioHelper dioHelper;

  DragonsRepository(this.dioHelper);
  @override
  // ignore: non_constant_identifier_names
  Future<Either<ApiErrorModel, List<Dragons>>> Get_all_Dragons() async {
    try {
      Response response = await dioHelper.get('v4/dragons');

      return Right((response.data as List)
          .map<Dragons>((e) => Dragons.fromJson(e))
          .toList());
    } on DioException catch (e) {
      ApiErrorModel apiErrorModel = ErrorHandler.instance.handleError(e);
      return Left(apiErrorModel);
    }
  }
}

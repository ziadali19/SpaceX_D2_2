import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex_d2_2/features/crew/data/model/crew_model.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/failure.dart';

abstract class BaseCrewRepository {
  Future<Either<ApiErrorModel, List<Crew>>> getCrew();
}

class CrewRepository implements BaseCrewRepository {
  final DioHelper dioHelper;

  CrewRepository(this.dioHelper);
  @override
  Future<Either<ApiErrorModel, List<Crew>>> getCrew() async {
    try {
      Response response = await dioHelper.get('v4/crew');

      return Right(
          (response.data as List).map<Crew>((e) => Crew.fromJson(e)).toList());
    } on DioException catch (e) {
      ApiErrorModel apiErrorModel = ErrorHandler.instance.handleError(e);
      return Left(apiErrorModel);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:spacex_d2_2/core/network/api_error_handler.dart';
import 'package:spacex_d2_2/core/network/api_manger.dart';
import 'package:spacex_d2_2/core/network/dio_helper.dart';
import 'package:spacex_d2_2/core/network/failure.dart';
import 'package:spacex_d2_2/features/launches/data/data_sources/remote/remote_ds.dart';
import 'package:spacex_d2_2/features/launches/domain/entities/launches_entity.dart';
import 'package:spacex_d2_2/features/launches/domain/repositers/luanches_repo.dart';

// abstract class BaseLaunchesRepository {
//   Future<Either<ApiErrorModel, List>> getlaunches();
// }

class LaunchesRepositoryImpl implements Launcherepo {
  Remotedatasource remotedatasource;
  LaunchesRepositoryImpl(this.remotedatasource);

  // DioHelper dioHelper;

  // LaunchesRepository({required this.dioHelper});

  // @override
  // Future<Either<ApiErrorModel, List>> getlaunches() async {
  //   Response response = await dioHelper.get('v4/launches/upcoming');
  //   return Right(response.data);
  // }

  @override
  Future<LaunchesEntity> launches() => remotedatasource.launches();
}

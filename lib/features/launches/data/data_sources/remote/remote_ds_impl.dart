import 'package:dio/dio.dart';
import 'package:spacex_d2_2/core/network/api_endpoints.dart';
import 'package:spacex_d2_2/core/network/api_error_handler.dart';
import 'package:spacex_d2_2/core/network/api_manger.dart';
import 'package:spacex_d2_2/core/network/failure.dart';
import 'package:spacex_d2_2/features/launches/data/data_sources/remote/remote_ds.dart';
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';

class remote_ds_Impl implements Remotedatasource {
  Apimanger apimanger;
  remote_ds_Impl(this.apimanger);

  Future<LuanchModel> launches() async {
    try {
      print('hello');
      Response response = await apimanger.getData(
        endpoint: endpoints.launches,
      );
      print('hello2${response.statusCode}');
      print('hello2${response.data}');

      LuanchModel luanchModel = LuanchModel.fromJson(response.data);
      return luanchModel;
    } on DioException catch (e) {
      ApiErrorModel apiErrorModel = ErrorHandler.instance.handleError(e);
      throw apiErrorModel;
    }
  }
}

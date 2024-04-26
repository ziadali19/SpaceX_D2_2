import 'package:dio/dio.dart';
import 'package:spacex_d2_2/core/utils/constants.dart';

class Apimanger {
  late Dio dio;
  Apimanger() {
    dio = Dio();
  }
  Future<Response> getData({
    required String endpoint,
  }) {
    return dio.get(AppConstants.baseUrl + endpoint);
  }

  Future<Response> postData(
      {required String endpoint, required Map<String, dynamic> body}) {
    return dio.post(AppConstants.baseUrl + endpoint, data: body);
  }
}

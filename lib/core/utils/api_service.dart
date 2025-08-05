import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://localhost:3000';

  final Dio dio;
  ApiService(this.dio);

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await dio.post('$_baseUrl$endPoint', data: data);
    return response;
  }
}

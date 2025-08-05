import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.13:3000';

  final Dio _dio;
  ApiService(this._dio);

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: data);
    return response;
  }
}

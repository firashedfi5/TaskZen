import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.12:3000';

  final Dio _dio;
  ApiService(this._dio);

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: data);
    return response;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Response> put({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.put('$_baseUrl$endPoint', data: data);
    return response;
  }
}

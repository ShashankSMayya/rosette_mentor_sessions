import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.interceptors.addAll([
      LogInterceptor(),
    ]);
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> body,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}

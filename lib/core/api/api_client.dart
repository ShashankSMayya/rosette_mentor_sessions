import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiClient {
  final Dio _dio;

  ApiClient({required Dio dio}) : _dio = dio;

  Future<dynamic> get(String path) async {
    try {
      final response = await _dio.get(path);
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

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/api/api_constants.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          contentType: Headers.jsonContentType,
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(milliseconds: 60 * 1000),
          receiveTimeout: const Duration(milliseconds: 60 * 1000),
          sendTimeout: const Duration(milliseconds: 30 * 1000),
          headers: {
            'Authorization': 'Bearer ${ApiConstants.token}',
          },
        ),
      );
}

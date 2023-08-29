import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_practice/domain/entities/app_error.dart';

class ApiCallWithError {
  const ApiCallWithError._();

  static Future<Either<AppError, T>> call<T>(Future<T> Function() f) async {
    try {
      return Right(await f());
    } on SocketException {
      return Left(AppError(type: AppErrorType.network));
    } on TimeoutException {
      return Left(AppError(type: AppErrorType.timeout));
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return Left(AppError(type: AppErrorType.timeout));
        case DioExceptionType.badResponse:

          return Left(AppError(
            type: AppErrorType.api,
            errorCode: e.response?.statusCode,
            errorMessage: e.message,
          ));
        case DioExceptionType.unknown:
          {
            if (e.error is SocketException) {
              return Left(AppError(type: AppErrorType.network));
            }
            return Left(AppError(type: AppErrorType.unknown));
          }
        default:
          return Left(AppError(type: AppErrorType.unknown));
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Left(AppError(type: AppErrorType.unknown));
    }
  }
}

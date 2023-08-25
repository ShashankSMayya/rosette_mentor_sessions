import 'package:dartz/dartz.dart';
import 'package:test_practice/data/models/user.dart';
import 'package:test_practice/domain/entities/app_error.dart';

abstract class AuthRepository{

  Future<Either<AppError,User>> login(Map<String,dynamic> params);

  Future<Either<AppError,User?>> getUser();

}
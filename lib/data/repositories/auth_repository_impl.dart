import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_practice/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:test_practice/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:test_practice/data/models/user.dart';
import 'package:test_practice/domain/entities/app_error.dart';
import 'package:test_practice/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<Either<AppError, User>> login(Map<String, dynamic> params) async {
    try {
      final user = await _authRemoteDataSource.login(params);
      await _authLocalDataSource.cacheUser(user);
      return Right(user);
    } catch (e) {
      return Left(AppError(type: AppErrorType.unknown));
    }
  }

  @override
  Future<Either<AppError, User?>> getUser()async {
   try{
      return Right(await _authLocalDataSource.getUser());
   }catch(e){
     return Left(AppError(type: AppErrorType.unknown));
   }
  }
}

import 'package:injectable/injectable.dart';
import 'package:test_practice/core/api/api_client.dart';
import 'package:test_practice/core/api/api_constants.dart';

import '../../models/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(Map<String, dynamic> params);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<User> login(Map<String, dynamic> params) async {
    final res = await _apiClient.post(ApiConstants.loginEndpoint, params);
    return User.fromJson(res);
  }
}

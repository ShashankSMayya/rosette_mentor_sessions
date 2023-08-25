import '../../models/user.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(User user);

  /// Returns null if no user is cached
  Future<User?> getUser();

  Future<void> deleteUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cacheUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<User?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:test_practice/constants/hive_constants.dart';

import '../../models/user.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(User user);

  /// Returns null if no user is cached
  Future<User?> getUser();

  Future<void> deleteUser();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> cacheUser(User user) async{
    final box = await Hive.openBox(HiveConstants.userBoxName);
    final userString = user.toJson();
    await box.put(HiveConstants.userKey, userString);

  }

  @override
  Future<User?> getUser() async{
    final box = await Hive.openBox(HiveConstants.userBoxName);
    final userString = box.get(HiveConstants.userKey);
    if(userString==null) return null;
    final userMap = Map<String, dynamic>.from(userString);
    return User.fromJson(userMap);
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}

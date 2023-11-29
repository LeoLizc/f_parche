import 'package:f_parche/domain/entities/user.dart';

abstract class UserRepository {
  Future<UserDetail?> getUserDetail(String key);
  Future<UserDetail> createUserDetail(UserDetail userDetail);
  Future<UserDetail> updateUserDetail(UserDetail userDetail);
}

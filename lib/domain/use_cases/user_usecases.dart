import 'package:f_parche/domain/entities/user.dart';
import 'package:f_parche/domain/repositories/user_repository.dart';

class UserUseCases {
  //This is a class that will contain all the use cases related to search for users, friends, etc.

  final UserRepository _userRepository;

  UserUseCases(this._userRepository);

  Future<UserDetail?> findUserById(String id) async {
    return await _userRepository.getUserDetail(id);
  }
}

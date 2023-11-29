import 'dart:async';

import 'package:f_parche/domain/entities/auth_entities.dart';
import 'package:f_parche/domain/entities/user.dart';
import 'package:f_parche/domain/repositories/user_repository.dart';
import 'package:f_parche/domain/services/auth_service.dart';

class AuthUsecases {
  final AuthService _authService;
  final UserRepository _userRepository;

  AuthUsecases(
    this._authService,
    this._userRepository,
  );

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _authService.signInWithEmailAndPassword(email, password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUpWithEmailAndPassword(
    String username,
    String email,
    String password,
  ) async {
    try {
      var user = await _authService.createUserWithEmailAndPassword(
        username,
        email,
        password,
      );

      await _userRepository.createUserDetail(
        UserDetail(
          key: user.id,
          username: username,
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    return await _authService.signOut();
  }

  User? getCurrentUser() {
    return _authService.getCurrentUser();
  }

  StreamSubscription<User?> subscribeToAuthChanges(
      void Function(User?) onData) {
    return _authService.authStateChanges.listen(onData);
  }

  Future<bool> isLoggedIn() async {
    return await _authService.isLoggedIn();
  }
}

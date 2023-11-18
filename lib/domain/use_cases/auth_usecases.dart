import 'dart:async';

import 'package:f_parche/domain/entities/auth_entities.dart';
import 'package:f_parche/domain/services/auth_service.dart';

class AuthUsecases {
  final AuthService _authService;

  AuthUsecases(this._authService);

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
      await _authService.createUserWithEmailAndPassword(
        username,
        email,
        password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    return await _authService.signOut();
  }

  Future<User?> getCurrentUser() async {
    return await _authService.getCurrentUser();
  }

  StreamSubscription<User?> subscribeToAuthChanges(
      void Function(User?) onData) {
    return _authService.authStateChanges.listen(onData);
  }

  Future<bool> isLoggedIn() async {
    return await _authService.isLoggedIn();
  }
}

import 'dart:async';

import 'package:f_parche/domain/entities/auth_entities.dart';
import 'package:f_parche/domain/services/auth_service.dart';

class AuthUsecases {
  final AuthService _authService;

  AuthUsecases(this._authService);

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _authService.createUserWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    return await _authService.signOut();
  }

  Future<User> getCurrentUser() async {
    return await _authService.getCurrentUser();
  }

  StreamSubscription<User?> subscribeToAuthChanges(
      void Function(User?) onData) {
    return _authService.authStateChanges.listen(onData);
  }
}

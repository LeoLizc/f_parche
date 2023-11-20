import 'package:f_parche/domain/entities/auth_entities.dart';
import 'package:f_parche/domain/services/auth_service.dart';

import 'dart:async';

class ALAuthService implements AuthService {
  User? _user = User(
    id: '1',
    username: 'pepito Perez',
    email: 'pepitoperez@example.ex',
  );

  final StreamController<User?> _authStateController =
      StreamController<User?>();

  @override
  Stream<User?> get authStateChanges => _authStateController.stream;

  @override
  Future<User> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
  ) async {
    User newUser = User(
      id: '2',
      username: username,
      email: email,
    );
    _user = newUser;

    _authStateController.add(newUser);
    return newUser;
  }

  @override
  Future<User?> getCurrentUser() async {
    return _user;
  }

  @override
  Future<bool> isLoggedIn() async {
    return _user != null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    User signedInUser = User(
      id: '3',
      username: 'signedInUser',
      email: email,
    );
    _user = signedInUser;

    _authStateController.add(signedInUser);
    return signedInUser;
  }

  @override
  Future<void> signOut() async {
    _user = null;

    _authStateController.add(null);
  }
}

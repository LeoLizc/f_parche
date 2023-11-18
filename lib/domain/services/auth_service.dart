import 'package:f_parche/domain/entities/auth_entities.dart';

/// An abstract class representing an authentication service.
abstract class AuthService {
  /// Signs in a user with the provided email and password.
  ///
  /// Returns a [Future] that completes with the authenticated [User].
  Future<User> signInWithEmailAndPassword(String email, String password);

  /// Creates a new user with the provided email and password.
  ///
  /// Returns a [Future] that completes with the created [User].
  Future<User> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
  );

  /// Signs out the currently authenticated user.
  ///
  /// Returns a [Future] that completes when the user is signed out.
  Future<void> signOut();

  /// Returns a [Stream] of [User] objects representing the authentication state changes.
  Stream<User?> get authStateChanges;

  /// Returns a [Future] that completes with the currently authenticated [User].
  Future<User?> getCurrentUser();

  /// Returns a [Future] that completes with the a boolean representing if the user is logged in.
  Future<bool> isLoggedIn();
}

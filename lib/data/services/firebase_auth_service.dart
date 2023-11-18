import 'package:f_parche/domain/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:f_parche/domain/entities/auth_entities.dart';

class FirebaseAuthService implements AuthService {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;

  @override
  Stream<User?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((fb.User? user) {
      return user == null
          ? null
          : User(id: user.uid, email: user.email!, username: user.displayName!);
    });
  }

  @override
  Future<User> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
  ) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await authResult.user!.updateDisplayName(username);

    return User(
      id: authResult.user!.uid,
      email: authResult.user!.email!,
      username: username,
    );
  }

  @override
  Future<User?> getCurrentUser() async {
    final fb.User? user = _firebaseAuth.currentUser;
    return user == null
        ? null
        : User(
            id: user.uid,
            email: user.email!,
            username: user.displayName!,
          );
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return User(
      id: authResult.user!.uid,
      email: authResult.user!.email!,
      username: authResult.user!.displayName!,
    );
  }

  @override
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isLoggedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }
}

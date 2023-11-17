import 'package:f_parche/domain/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:f_parche/domain/entities/auth_entities.dart';

class FirebaseAuthService implements AuthService {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;

  @override
  Stream<User?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((fb.User? user) {
      return user == null ? null : User(id: user.uid, email: user.email!);
    });
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return User(id: authResult.user!.uid, email: authResult.user!.email!);
  }

  @override
  Future<User> getCurrentUser() async {
    final fb.User? user = _firebaseAuth.currentUser;
    return User(id: user!.uid, email: user.email!);
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return User(id: authResult.user!.uid, email: authResult.user!.email!);
  }

  @override
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

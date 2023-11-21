import 'package:f_parche/domain/entities/auth_entities.dart';
import 'package:f_parche/domain/use_cases/auth_usecases.dart';
import 'package:f_parche/navigation.dart';
import 'package:get/get.dart';

class AuthController extends GetxService {
  final AuthUsecases _authUseCases;

  final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  AuthController(this._authUseCases) {
    _authUseCases.isLoggedIn().then((value) {
      _isLoggedIn.value = value;
    });
  }

  @override
  void onInit() {
    super.onInit();

    _authUseCases.subscribeToAuthChanges((user) {
      final bool isLoggedIn = user != null;
      if (isLoggedIn != _isLoggedIn.value) {
        _isLoggedIn.value = isLoggedIn;
        // navigate to home if not already in that route
        if (Get.currentRoute != Routes.home) {
          Get.offAllNamed(Routes.home);
        }
      }
    });
  }

  Future<bool> login({
    required String email,
    required String password,
  }) {
    // implement login logic here
    return _authUseCases.signInWithEmailAndPassword(email, password);
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) {
    // implement register logic here
    return _authUseCases.signUpWithEmailAndPassword(username, email, password);
  }

  void logout() {
    // implement logout logic here
    _authUseCases.signOut();
  }

  User? getCurrentUser() {
    // implement getCurrentUser logic here
    return _authUseCases.getCurrentUser();
  }
}

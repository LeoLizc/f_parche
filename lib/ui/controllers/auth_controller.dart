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
      if (user == null) {
        _isLoggedIn.value = false;
        Get.offAllNamed(Routes.home);
      } else {
        _isLoggedIn.value = true;
        Get.offAllNamed(Routes.home);
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
    required String email,
    required String password,
  }) {
    // implement register logic here
    return _authUseCases.signUpWithEmailAndPassword(email, password);
  }

  void logout() {
    // implement logout logic here
    _authUseCases.signOut();
  }
}

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
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.home);
      }
    });
  }

  void login() {
    // implement login logic here
    _isLoggedIn.value = true;
  }

  void logout() {
    // implement logout logic here
    _isLoggedIn.value = false;
    Get.offAllNamed(Routes.home);
  }
}

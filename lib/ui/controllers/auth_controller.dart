import 'package:f_parche/navigation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _isLoggedIn = true.obs;
  bool get isLoggedIn => _isLoggedIn.value;

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

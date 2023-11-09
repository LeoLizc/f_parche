import 'package:get/get.dart';

class AuthController extends GetxController {
  final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  void login() {
    // implement login logic here
    _isLoggedIn.value = true;
  }

  void logout() {
    // implement logout logic here
    _isLoggedIn.value = false;
  }
}

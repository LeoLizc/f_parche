import 'package:f_parche/navigation.dart';
import 'package:f_parche/ui/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProtectedRoute extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    if (!authController.isLoggedIn) {
      return const RouteSettings(name: Routes.home);
    }
    return null;
  }
}

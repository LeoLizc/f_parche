import 'package:f_parche/data/services/firebase_auth_service.dart';
import 'package:f_parche/domain/services/auth_service.dart';
import 'package:f_parche/domain/use_cases/auth_usecases.dart';
import 'package:get/get.dart';

import 'ui/controllers/auth_controller.dart';

void loadDependencies() {
  Get.put<AuthService>(FirebaseAuthService());

  Get.put(AuthUsecases(Get.find<AuthService>()));

  Get.put<AuthController>(AuthController(
    Get.find<AuthUsecases>(),
  ));
}

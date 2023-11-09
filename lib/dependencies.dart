import 'package:get/get.dart';

import 'ui/controllers/auth_controller.dart';

void loadDependencies() {
  Get.put<AuthController>(AuthController());
}

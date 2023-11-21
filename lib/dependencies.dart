// ignore_for_file: unused_import
// TODO: Remove unused imports

import 'package:f_parche/data/repositories/firebase_chat_item_repo.dart';
import 'package:f_parche/data/repositories/firebase_chat_repo.dart';
import 'package:f_parche/data/repositories/firebase_message_repo.dart';
import 'package:f_parche/data/repositories/firebase_parche_repo.dart';
import 'package:f_parche/data/services/al_auth_service.dart';
import 'package:f_parche/data/services/firebase_auth_service.dart';
import 'package:f_parche/data/test_repositories/fake_chat_item_repo.dart';
import 'package:f_parche/data/test_repositories/fake_chat_repo.dart';
import 'package:f_parche/domain/repositories/chat_item_repository.dart';
import 'package:f_parche/domain/repositories/chat_repository.dart';
import 'package:f_parche/domain/repositories/messages_repository.dart';
import 'package:f_parche/domain/repositories/parche_repository.dart';
import 'package:f_parche/domain/services/auth_service.dart';
import 'package:f_parche/domain/use_cases/auth_usecases.dart';
import 'package:f_parche/domain/use_cases/chat_usecases.dart';
import 'package:f_parche/domain/use_cases/parche_usecases.dart';
import 'package:f_parche/ui/controllers/chat_controller.dart';
import 'package:f_parche/ui/controllers/parche_controller.dart';
import 'package:get/get.dart';

import 'ui/controllers/auth_controller.dart';

void loadDependencies() {
  Get.put<AuthService>(ALAuthService());
  Get.put<ParcheRepository>(FirebaseParcheRepo());
  Get.put<ChatRepository>(FakeChatRepo());
  Get.put<ChatItemRepository>(FakeChatItemRepo());
  Get.put<MessagesRepository>(FirebaseMessageRepo());

  Get.put(AuthUsecases(Get.find<AuthService>()));
  Get.put(ParcheUseCases(
    chatItemRepository: Get.find<ChatItemRepository>(),
    parcheRepository: Get.find<ParcheRepository>(),
    chatRepository: Get.find<ChatRepository>(),
    authRepository: Get.find<AuthService>(),
  ));
  Get.put(ChatUseCases(
    chatItemRepository: Get.find<ChatItemRepository>(),
    authService: Get.find<AuthService>(),
    chatRepository: Get.find<ChatRepository>(),
    messagesRepository: Get.find<MessagesRepository>(),
  ));

  Get.put<AuthController>(AuthController(
    Get.find<AuthUsecases>(),
  ));
  Get.put(ParcheController(
    parcheUseCases: Get.find<ParcheUseCases>(),
  ));
  Get.put(
    ChatController(
      Get.find<ChatUseCases>(),
    ),
  );
}

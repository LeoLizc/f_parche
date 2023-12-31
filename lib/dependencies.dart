// ignore_for_file: unused_import
// TODO: Remove unused imports

import 'package:f_parche/data/repositories/firebase_chat_item_repo.dart';
import 'package:f_parche/data/repositories/firebase_chat_repo.dart';
import 'package:f_parche/data/repositories/firebase_message_repo.dart';
import 'package:f_parche/data/repositories/firebase_parche_repo.dart';
import 'package:f_parche/data/repositories/firebase_user_repo.dart';
import 'package:f_parche/data/services/al_auth_service.dart';
import 'package:f_parche/data/services/firebase_auth_service.dart';
import 'package:f_parche/data/test_repositories/fake_chat_item_repo.dart';
import 'package:f_parche/data/test_repositories/fake_chat_repo.dart';
import 'package:f_parche/data/test_repositories/fake_message_repo.dart';
import 'package:f_parche/domain/repositories/chat_item_repository.dart';
import 'package:f_parche/domain/repositories/chat_repository.dart';
import 'package:f_parche/domain/repositories/messages_repository.dart';
import 'package:f_parche/domain/repositories/parche_repository.dart';
import 'package:f_parche/domain/repositories/user_repository.dart';
import 'package:f_parche/domain/services/auth_service.dart';
import 'package:f_parche/domain/use_cases/auth_usecases.dart';
import 'package:f_parche/domain/use_cases/chat_usecases.dart';
import 'package:f_parche/domain/use_cases/parche_usecases.dart';
import 'package:f_parche/domain/use_cases/user_usecases.dart';
import 'package:f_parche/ui/controllers/chat_controller.dart';
import 'package:f_parche/ui/controllers/parche_controller.dart';
import 'package:get/get.dart';

import 'ui/controllers/auth_controller.dart';

void loadDependencies() {
  Get.put<AuthService>(FirebaseAuthService());
  Get.put<ParcheRepository>(FirebaseParcheRepo());
  Get.put<ChatRepository>(FirebaseChatRepo());
  Get.put<ChatItemRepository>(FirebaseChatItemRepo());
  Get.put<MessagesRepository>(FirebaseMessageRepo());
  Get.put<UserRepository>(FirebaseUserRepo());

  Get.put(AuthUsecases(
    Get.find<AuthService>(),
    Get.find<UserRepository>(),
  ));
  Get.put(ParcheUseCases(
    chatItemRepository: Get.find<ChatItemRepository>(),
    parcheRepository: Get.find<ParcheRepository>(),
    chatRepository: Get.find<ChatRepository>(),
  ));
  Get.put(ChatUseCases(
    chatItemRepository: Get.find<ChatItemRepository>(),
    authService: Get.find<AuthService>(),
    chatRepository: Get.find<ChatRepository>(),
    messagesRepository: Get.find<MessagesRepository>(),
  ));
  Get.put(
    UserUseCases(
      Get.find<UserRepository>(),
    ),
  );

  Get.put<AuthController>(AuthController(
    Get.find<AuthUsecases>(),
  ));
  Get.put(ParcheController(
    parcheUseCases: Get.find<ParcheUseCases>(),
    userUseCases: Get.find<UserUseCases>(),
  ));
  Get.put(
    ChatController(
      Get.find<ChatUseCases>(),
    ),
  );
}

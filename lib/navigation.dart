import 'package:f_parche/ui/controllers/auth_controller.dart';
import 'package:f_parche/ui/middlewares/auth_mw.dart';
import 'package:f_parche/ui/pages/auth/login.dart';
import 'package:f_parche/ui/pages/auth/signup.dart';
import 'package:f_parche/ui/pages/chats.dart';
import 'package:f_parche/ui/pages/crear_parche.dart';
import 'package:f_parche/ui/pages/home.dart';
import 'package:f_parche/ui/pages/mapa.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const home = '/';
  static const register = '/register';
  static const parches = '/parches';
  static const create = '/create';
  // static const chat = '/chat';
  static const map = '/map';
}

final appPages = [
  GetPage(
    name: '/',
    page: () {
      final authControler = Get.find<AuthController>();
      return Obx(
          () => authControler.isLoggedIn ? const HomePage() : LoginPage());
    },
  ),
  GetPage(
    name: Routes.register,
    page: () => SignUpPage(),
    // middlewares: [],
  ),
  GetPage(
    name: Routes.parches,
    page: () => const ChatsPage(),
    middlewares: [ProtectedRoute()],
  ),
  GetPage(
    name: Routes.create,
    page: () => const CrearParchePage(),
    middlewares: [ProtectedRoute()],
  ),
  // GetPage(
  //   name: Routes.chat,
  //   page: () => const ChatRoomPage(),
  //   middlewares: [ProtectedRoute()],
  // ),
  GetPage(
    name: Routes.map,
    page: () => const MapaPage(),
    middlewares: [ProtectedRoute()],
  ),
];

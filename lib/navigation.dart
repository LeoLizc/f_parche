import 'package:f_parche/ui/middlewares/auth_mw.dart';
import 'package:f_parche/ui/pages/auth/login.dart';
import 'package:f_parche/ui/pages/auth/signup.dart';
import 'package:f_parche/ui/pages/chat.dart';
import 'package:f_parche/ui/pages/create_parche.dart';
import 'package:f_parche/ui/pages/home.dart';
import 'package:f_parche/ui/pages/mapa.dart';
import 'package:f_parche/ui/pages/parches.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const parches = '/parches';
  static const create = '/create';
  static const chat = '/chat';
  static const map = '/map';
}

final appPages = [
  GetPage(
    name: '/',
    page: () => const HomePage(),
  ),
  // GetPage(name: '/', page: () => const HomePage()),
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
  ),
  GetPage(
    name: Routes.register,
    page: () => SignUpPage(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomePage(),
    middlewares: [
      ProtectedRoute(),
    ],
  ),
  GetPage(
      name: Routes.parches,
      page: () => const ParchePage()), // TODO Corregir tamaños
  GetPage(
    name: Routes.create,
    page: () => CreateParchePage(),
  ),
  GetPage(
    name: Routes.chat,
    page: () => const ChatRoomPage(),
  ),
  GetPage(
    name: Routes.map,
    page: () => const MapaPage(),
  ),
];

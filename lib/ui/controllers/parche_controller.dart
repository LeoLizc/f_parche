import 'package:f_parche/domain/entities/parche.dart';
import 'package:f_parche/domain/entities/user.dart';
import 'package:f_parche/domain/use_cases/parche_usecases.dart';
import 'package:f_parche/domain/use_cases/user_usecases.dart';
import 'package:get/get.dart';

class ParcheController extends GetxController {
  final ParcheUseCases _parcheUseCases;
  final UserUseCases _userUseCases;

  ParcheController({
    required ParcheUseCases parcheUseCases,
    required UserUseCases userUseCases,
  })  : _parcheUseCases = parcheUseCases,
        _userUseCases = userUseCases;

  Future<bool> createParche(Parche parche) {
    return _parcheUseCases.createParche(parche);
  }

  Future<UserDetail?> findUserById(String id) {
    return _userUseCases.findUserById(id);
  }
}

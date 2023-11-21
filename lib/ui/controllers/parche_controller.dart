import 'package:f_parche/domain/entities/parche.dart';
import 'package:f_parche/domain/use_cases/parche_usecases.dart';
import 'package:get/get.dart';

class ParcheController extends GetxController {
  final ParcheUseCases _parcheUseCases;

  ParcheController({
    required ParcheUseCases parcheUseCases,
  }) : _parcheUseCases = parcheUseCases;

  Future<bool> createParche(Parche parche) {
    return _parcheUseCases.createParche(parche);
  }
}

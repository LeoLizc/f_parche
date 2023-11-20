import 'package:f_parche/domain/entities/parche.dart';

abstract class ParcheRepository {
  Parche getParche(String key);
  Parche createParche(Parche parche);
}

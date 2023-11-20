import 'package:f_parche/domain/entities/parche.dart';

abstract class ParcheRepository {
  Future<Parche?> getParche(String key);
  Future<Parche> createParche(Parche parche);
}

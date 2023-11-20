import 'package:f_parche/domain/entities/parche.dart';
import 'package:f_parche/domain/repositories/parche_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseParcheRepo implements ParcheRepository {
  final _parcheCollection = FirebaseDatabase.instance.ref().child('parches');

  @override
  Future<Parche> createParche(Parche parche) async {
    final newParcheRef = _parcheCollection.push();
    newParcheRef.set(parche.toMap());
    return parche.copyWith(key: newParcheRef.key);
  }

  @override
  Future<Parche?> getParche(String key) async {
    final parcheRef = _parcheCollection.child(key);
    final parcheEvent = await parcheRef.once();

    if (!parcheEvent.snapshot.exists) {
      return null;
    }

    return Parche.fromMap(parcheEvent.snapshot.value as Map<String, dynamic>,
        parcheEvent.snapshot.key!);
  }
}

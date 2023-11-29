import 'package:f_parche/domain/entities/user.dart';
import 'package:f_parche/domain/repositories/user_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseUserRepo implements UserRepository {
  final _userCollection = FirebaseDatabase.instance.ref().child('users');

  @override
  Future<UserDetail> createUserDetail(UserDetail userDetail) async {
    final newUserRef = _userCollection.push();
    newUserRef.set(userDetail.toMap());
    return userDetail.copyWith(key: newUserRef.key);
  }

  @override
  Future<UserDetail?> getUserDetail(String key) async {
    final userRef = _userCollection.child(key);
    final userEvent = await userRef.once();

    if (!userEvent.snapshot.exists) {
      return null;
    }

    return UserDetail.fromMap(userEvent.snapshot.value as Map<dynamic, dynamic>,
        userEvent.snapshot.key!);
  }

  @override
  Future<UserDetail> updateUserDetail(UserDetail userDetail) async {
    final userRef = _userCollection.child(userDetail.key);
    userRef.set(userDetail.toMap());
    return userDetail;
  }
}

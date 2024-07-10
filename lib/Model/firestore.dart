import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/Model/userModel.dart';

class FireStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> storeDate(UserModel user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toMap());
    } catch (e) {
      print('Error storing user data: $e');
    }
  }

  Future<UserModel?> getData(String uid) async {
    try {
      DocumentSnapshot _doc = await _db.collection('users').doc(uid).get();
      if (_doc.exists) {
        return UserModel.fromMap(_doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error retrieving user data: $e');
    }
    return null;
  }
}

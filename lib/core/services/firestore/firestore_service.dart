import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/user_model.dart';

class FireStoreService {
  final SimpleUser user;
  final dynamic userCredential;

  FireStoreService(this.userCredential, {required this.user});

  final db = FirebaseFirestore.instance;

  void saveUserToDatabase() {
    db.collection("users").doc(userCredential).set({
      'userName': user.name,
      'userEmail': user.email,
      'userPassword': user.password,
    });
  }
}

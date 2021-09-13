import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String email;
  String password;
  String? confirmPassword;
  String? name;
  String? id;
  //firestore ref
  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');
  User(this.email, this.password, [this.confirmPassword, this.name, this.id]);

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}

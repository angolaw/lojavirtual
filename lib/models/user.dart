import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? id;
  //firestore ref
  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');
  User(this.email, this.password, [this.confirmPassword, this.name, this.id]);
  User.fromDocument(DocumentSnapshot document) {
    name = document.data['name'] as String;
    email = document.data['email'] as String;
    id = document.data['id'] as String;
  }
  User.empty(
      {this.name = "",
      this.id = "",
      this.email = "",
      this.password = "",
      this.confirmPassword = ""});

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

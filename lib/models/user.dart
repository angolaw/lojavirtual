import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String email;
  String password;
  String? confirmPassword;
  String? name;
  String? id;
  User(this.email, this.password, [this.confirmPassword, this.name, this.id]);

  Future<void> saveData() async {
    await Firestore.instance.collection('users').document(id).setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/helpers/firebase_errors.dart';
import 'package:lojavirtual/models/user.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signIn({required User user, required Function onFail}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      print(result.user.uid);
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}

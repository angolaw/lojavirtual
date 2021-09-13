import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/helpers/firebase_errors.dart';
import 'package:lojavirtual/models/user.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late FirebaseUser user;
  bool _loading = false;
  bool get loading => _loading;
  final Firestore firestore = Firestore.instance;

  UserManager() {
    _loadCurrentUser();
  }

  Future<void> signIn(
      {required User user,
      required Function onFail,
      required Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      //TODO remove!
      await Future.delayed(const Duration(seconds: 3));
      this.user = result.user;
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final FirebaseUser currentUser = await auth.currentUser();
    if (currentUser != null) {
      final DocumentSnapshot doc =
          await firestore.collection('users').document(currentUser.uid).get();
    }
    notifyListeners();
  }

  Future<void> signUp({
    required User user,
    required Function onSuccess,
    required Function onFail,
  }) async {
    loading = true;
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      this.user = result.user;
      user.id = result.user.uid;
      await user.saveData();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}

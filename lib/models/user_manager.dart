import 'package:firebase_auth/firebase_auth.dart';
import 'package:lojavirtual/models/user.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signIn(User user) async {
    final AuthResult result = await auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
  }
}

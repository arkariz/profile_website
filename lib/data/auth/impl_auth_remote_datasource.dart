import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapala_unjani/data/auth/auth_remote_datasource.dart';

class ImplAuthRemoteDatasource implements AuthRemoteDatasource {
  final fireAuth = FirebaseAuth.instance;

  Future<UserCredential> loginUsingEmail(String email, String password) async {
    UserCredential userCredential = await fireAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }
}

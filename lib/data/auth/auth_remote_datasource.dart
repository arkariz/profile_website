import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<UserCredential>loginUsingEmail(String email, String password);
}
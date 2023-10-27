import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> singInEmailAndPassword(
      String email, String password) async {
    final reqvest = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    return reqvest;
  }
  Future<UserCredential?> registrterEmailAndPassword(
      String email, String password) async {
    final reqvest = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    return reqvest;
  }
  Future<ConfirmationResult?> singInPhoneNumber(String phoneNumber) async {
    final reqvest = await _firebaseAuth.signInWithPhoneNumber(phoneNumber);
    return reqvest;
  }


  logOut(
      String email, String password) async {
     await _firebaseAuth.signOut();
  }


}

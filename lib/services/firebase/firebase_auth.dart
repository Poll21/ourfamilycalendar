import 'package:firebase_auth/firebase_auth.dart';


class FirebaseService {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get currenseUser  => _firebaseAuth.authStateChanges();
}

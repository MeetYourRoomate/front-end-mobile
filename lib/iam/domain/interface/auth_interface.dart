import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<User?> signInWithGoogle();
  Future<void> signOut();
}

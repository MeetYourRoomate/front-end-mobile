import 'package:firebase_auth/firebase_auth.dart';
import 'package:meet_your_roommate_app/iam/domain/interface/auth_interface.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/data/firebase/authentication.dart';

class AuthRepository extends AuthInterface {
  final Authentication _authentication = Authentication();

  @override
  Future<User?> signInWithGoogle() async {
    final User? user = await _authentication.signInWithGoogle();
    return user;
  }

  @override
  Future<void> signOut() async {
    _authentication.signOut();
  }
}

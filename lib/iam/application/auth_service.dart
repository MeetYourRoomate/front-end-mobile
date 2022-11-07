import 'package:firebase_auth/firebase_auth.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/repositories/auth_repository.dart';

class AuthService {
  final AuthRepository _authRepository = AuthRepository();

  Future<User?> signInWithGoogle() async {
    return _authRepository.signInWithGoogle();
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }
}

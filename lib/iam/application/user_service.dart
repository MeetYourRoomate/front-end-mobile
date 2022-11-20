import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<UserAuth> getUserById(String uid) async {
    return _userRepository.getUserById(uid);
  }

  Future<UserAuth> saveUser(UserAuth user) async {
    return _userRepository.saveUser(user);
  }

  Future<UserAuth> updateUser(String uid) async {
    return _userRepository.updateUser(uid);
  }
}

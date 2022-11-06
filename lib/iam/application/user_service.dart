import 'package:meet_your_roommate/iam/domain/entity/user.dart';
import 'package:meet_your_roommate/iam/infraestructure/repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();

  Future<UserAuth> getUser() async {
    return _userRepository.getUser();
  }

  Future<UserAuth> saveUser(UserAuth user) async {
    return _userRepository.saveUser(user);
  }

  Future<UserAuth> updateUser(String uid) async {
    return _userRepository.updateUser(uid);
  }
}

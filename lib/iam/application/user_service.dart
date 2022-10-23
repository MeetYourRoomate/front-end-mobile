import 'package:meet_your_roommate/iam/domain/entity/user.dart';
import 'package:meet_your_roommate/iam/infraestructure/repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();

  Future<User> getUser() async {
    return _userRepository.getUser();
  }
}

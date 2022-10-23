import 'package:meet_your_roommate/iam/domain/entity/user.dart';

abstract class UserInterface {
  Future<User> getUser();
  Future<User> saveUser(User user);
}

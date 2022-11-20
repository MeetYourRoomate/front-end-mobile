import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';

abstract class UserInterface {
  Future<UserAuth> getUserById(String uid);
  Future<UserAuth> saveUser(UserAuth user);
  Future<UserAuth> updateUser(String uid);
}

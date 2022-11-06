import 'package:meet_your_roommate/iam/domain/entity/user.dart';
import 'package:meet_your_roommate/iam/domain/interface/user_interface.dart';
import 'package:meet_your_roommate/iam/infraestructure/data/api/user_data_source.dart';
import 'package:meet_your_roommate/iam/infraestructure/models/user_model.dart';

class UserRepository implements UserInterface {
  final UserDataSource _userDataSource = UserDataSource();

  @override
  Future<UserAuth> getUser() async {
    final UserAuth user = await _userDataSource.getUser();
    return user;
  }

  @override
  Future<UserAuth> saveUser(UserAuth user) async {
    UserModel userModel = UserModel(user.id, user.email, null, null);
    final UserAuth newUser = await _userDataSource.saveUser(userModel);
    return newUser;
  }

  @override
  Future<UserAuth> updateUser(String uid) async {
    final UserAuth newUser = await _userDataSource.updateUser(uid);
    return newUser;
  }
}

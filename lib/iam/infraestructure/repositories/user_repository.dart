import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';
import 'package:meet_your_roommate_app/iam/domain/interface/user_interface.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/data/api/user_data_source.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/models/user_model.dart';

class UserRepository implements UserInterface {
  final UserDataSource _userDataSource;

  UserRepository(this._userDataSource);

  @override
  Future<UserAuth> getUserById(String uid) async {
    final UserAuth user = await _userDataSource.getUserById(uid);
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

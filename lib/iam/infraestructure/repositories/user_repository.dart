import 'package:meet_your_roommate/iam/domain/entity/user.dart';
import 'package:meet_your_roommate/iam/domain/interface/user_interface.dart';
import 'package:meet_your_roommate/iam/infraestructure/data/api/user_data_source.dart';

class UserRepository implements UserInterface {
  final UserDataSource _userDataSource = UserDataSource();

  @override
  Future<User> getUser() async {
    final User user = await _userDataSource.getUser();
    return user;
  }

  @override
  Future<User> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}

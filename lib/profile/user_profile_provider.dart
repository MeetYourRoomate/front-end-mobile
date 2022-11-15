import 'package:flutter/cupertino.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class UserProfileProvider with ChangeNotifier {
  int _id = -1;
  String _name = "";
  String _surname = "";
  String _photoUrl = "";
  String _phoneNumber = "";
  String _phoneCode = "";
  String _description = "";
  String _teamStatus = "";

  int? get id => _id;
  String? get name => _name;
  String? get surname => _surname;
  String? get photoUrl => _photoUrl;
  String? get phoneNumber => _phoneNumber;
  String? get phoneCode => _phoneCode;
  String? get description => _description;
  String? get teamStatus => _teamStatus;

  Future<void> setUserProfileProvider(UserProfile userProfile) async {
    _id = userProfile.id!;
    _name = userProfile.name!;
    _surname = userProfile.surname!;
    _photoUrl = userProfile.photoUrl!;
    _phoneNumber = userProfile.phoneNumber!;

    _phoneCode = userProfile.phoneCode!;
    _description = userProfile.description!;
    _teamStatus = userProfile.teamStatus!;

    notifyListeners();
  }
}

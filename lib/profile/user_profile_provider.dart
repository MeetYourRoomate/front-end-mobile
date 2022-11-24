import 'package:flutter/cupertino.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class UserProfileProvider with ChangeNotifier {
  List<UserProfile> _listProfiles = [];

  int _id = -1;
  String _name = "";
  String _surname = "";
  String _photoUrl = "";
  String _phoneNumber = "";
  String _phoneCode = "";
  String _about = "";
  String _teamStatus = "";

  int get id => _id;
  String get name => _name;
  String get surname => _surname;
  String get photoUrl => _photoUrl;
  String get phoneNumber => _phoneNumber;
  String get phoneCode => _phoneCode;
  String get description => _about;
  String get teamStatus => _teamStatus;
  List<UserProfile> get listProfiles => _listProfiles;

  Future<void> setUserProfileProvider(String uid) async {
    UserProfileService userProfileService = locator<UserProfileService>();

    final data = await userProfileService.getUserProfileByUserId(uid);

    _id = data.id!;
    _name = data.name!;
    _surname = data.surname!;
    _photoUrl = data.photoUrl ?? "";
    _phoneNumber = data.phoneNumber!;

    _phoneCode = data.phoneCode!;
    _about = data.about!;
    _teamStatus = data.teamStatus!;
    notifyListeners();
  }

  Future<void> clear() async {
    _id = -1;
    _name = "";
    _surname = "";
    _photoUrl = "";
    _phoneNumber = "";
    _phoneCode = "";
    _about = "";
    _teamStatus = "";
  }

  Future<void> setListProfiles(String uid) async {
    UserProfileService userProfileService = locator<UserProfileService>();
    _listProfiles =
        await userProfileService.getAllUsersProfilesWithoutTeam(uid);
    notifyListeners();
  }
}

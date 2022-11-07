import 'package:flutter/cupertino.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class UserProvider with ChangeNotifier {
  UserProvider(this._isLogged);
  bool _isLogged = false;
  String _userStatus = "user";
  UserProfile _userProfile = UserProfile(null, null);

  bool get isLogged => _isLogged;
  String get userStatus => _userStatus;

  UserProfile get userProfile => _userProfile;

  Future<void> setIsLogged({required bool isLogged}) async {
    _isLogged = isLogged;
    notifyListeners();
  }

  Future<void> setUserStatus({required String userStatus}) async {
    _userStatus = userStatus;
    notifyListeners();
  }

  Future<void> setUserProfile(UserProfile userProfile) async {
    _userProfile = userProfile;
    notifyListeners();
  }
}

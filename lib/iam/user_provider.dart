import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  UserProvider(this._isLogged);
  bool _isLogged;
  String _userStatus = "ROLE_USER_STUDENT";

  bool get isLogged => _isLogged;
  String get userStatus => _userStatus;
  Future<void> setIsLogged({required bool isLogged}) async {
    _isLogged = isLogged;
    notifyListeners();
  }

  Future<void> setUserStatus({required String userStatus}) async {
    _userStatus = userStatus;
    notifyListeners();
  }
}

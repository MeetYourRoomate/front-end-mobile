class UserProfile {
  final String? _name;
  final String? _photoUrl;

  UserProfile(this._name, this._photoUrl);

  String? get name => _name;
  String? get photoUrl => _photoUrl;
}

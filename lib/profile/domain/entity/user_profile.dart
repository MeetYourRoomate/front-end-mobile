class UserProfile {
  final int? _id;
  final String? _name;
  final String? _surname;
  final String? _photoUrl;
  final String? _phoneNumber;
  final String? _phoneCode;
  final String? _description;
  final String? _teamStatus;

  UserProfile(this._name, this._photoUrl, this._surname, this._phoneNumber,
      this._phoneCode, this._description, this._teamStatus, this._id);
  int? get id => _id;
  String? get name => _name;
  String? get surname => _surname;
  String? get photoUrl => _photoUrl;
  String? get phoneNumber => _phoneNumber;
  String? get phoneCode => _phoneCode;
  String? get description => _description;
  String? get teamStatus => _teamStatus;
}

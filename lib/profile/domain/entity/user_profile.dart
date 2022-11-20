class UserProfile {
  final int? _id;
  final String? _name;
  final String? _surname;
  final String? _photoUrl;
  final String? _gender;
  final String? _about;

  final String? _teamStatus;
  final String? _country;
  final String? _city;
  final int? _age;
  final String? _phoneNumber;
  final String? _phoneCode;

  UserProfile(
    this._id,
    this._name,
    this._surname,
    this._photoUrl,
    this._gender,
    this._about,
    this._teamStatus,
    this._country,
    this._city,
    this._age,
    this._phoneNumber,
    this._phoneCode,
  );
  int? get id => _id;
  String? get name => _name;
  String? get surname => _surname;
  String? get photoUrl => _photoUrl;
  String? get phoneNumber => _phoneNumber;
  String? get phoneCode => _phoneCode;
  String? get about => _about;
  String? get gender => _gender;
  String? get country => _country;
  String? get city => _city;
  String? get teamStatus => _teamStatus;
  int? get age => _age;
}

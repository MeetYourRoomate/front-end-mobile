class UserAuth {
  final String? _id;
  final String? _email;
  final bool? _active;
  final String? _role;

  UserAuth(
    this._id,
    this._email,
    this._active,
    this._role,
  );
  String? get id => _id;
  String? get email => _email;
  bool? get active => _active;
  String? get role => _role;
}

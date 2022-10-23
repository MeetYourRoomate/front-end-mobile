class User {
  final int? _id;
  final String? _title;
  User(
    this._id,
    this._title,
  );
  int? get id => _id;
  String? get title => _title;
}

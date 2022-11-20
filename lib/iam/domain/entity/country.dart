class Country {
  final String _ulrImage;
  final String _name;
  final String _code;
  Country(this._ulrImage, this._name, this._code);

  String? get urlImage => _ulrImage;
  String? get name => _name;
  String? get code => _code;
}

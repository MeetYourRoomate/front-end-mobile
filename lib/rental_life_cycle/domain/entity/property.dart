class Property {
  final String? _tittle;
  final String? _description;
  final String? _currency;
  final String? _conditions;
  final int? _price;

  Property(this._description, this._tittle, this._currency, this._conditions,
      this._price);

  String? get description => _description;
  String? get tittle => _tittle;

  String? get currency => _currency;
  String? get conditions => _conditions;
  int? get price => _price;
}

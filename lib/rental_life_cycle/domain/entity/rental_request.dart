class RentalRequest {
  final String? _message;
  final String? _userId;
  final int? _rentalOfferId;

  RentalRequest(this._message, this._userId, this._rentalOfferId);

  String? get message => _message;
  String? get userId => _userId;
  int? get rentalOfferId => _rentalOfferId;
}

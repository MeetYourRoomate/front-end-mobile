import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';

class RentalRequest {
  final int? _id;
  final String? _status;
  final String? _message;
  final UserProfile? _studentProfile;
  final RentalOffer? _rentalOffer;
  final String? _userId;
  final int? _rentalOfferId;

  RentalRequest(
    this._id,
    this._status,
    this._message,
    this._studentProfile,
    this._rentalOffer,
    this._userId,
    this._rentalOfferId,
  );

  int? get id => _id;
  String? get status => _status;
  String? get message => _message;
  UserProfile? get studentProfile => _studentProfile;
  RentalOffer? get rentalOffer => _rentalOffer;
  String? get userId => _userId;
  int? get rentalOfferId => _rentalOfferId;
}

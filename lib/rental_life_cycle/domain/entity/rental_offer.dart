import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';

class RentalOffer {
  final int? _id;
  final double? _price;
  final String? _currency;
  final String? _conditions;
  final String? _status;
  final String? _visibility;
  final Property? _property;
  final UserProfile? _userProfile;

  RentalOffer(
    this._id,
    this._price,
    this._currency,
    this._conditions,
    this._status,
    this._visibility,
    this._userProfile,
    this._property,
  );

  int? get id => _id;
  double? get price => _price;
  String? get currency => _currency;
  String? get conditions => _conditions;
  String? get status => _status;
  String? get visibility => _visibility;
  Property? get property => _property;
  UserProfile? get userProfile => _userProfile;
}

import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';

class Property {
  final int? _propertyId;
  final int? _rentalOfferId;
  final String? _tittle;
  final String? _description;
  final String? _currency;
  final String? _conditions;
  final int? _price;
  final List<PropertyAsset>? _assets;
  final UserProfile? _userProfile;

  Property(
      this._description,
      this._tittle,
      this._currency,
      this._conditions,
      this._price,
      this._assets,
      this._propertyId,
      this._rentalOfferId,
      this._userProfile);

  List<PropertyAsset>? get assets => _assets;
  UserProfile? get userProfile => _userProfile;
  String? get description => _description;
  String? get tittle => _tittle;

  String? get currency => _currency;
  String? get conditions => _conditions;
  int? get price => _price;
  int? get propertyId => _propertyId;
  int? get rentalOfferId => _rentalOfferId;
}

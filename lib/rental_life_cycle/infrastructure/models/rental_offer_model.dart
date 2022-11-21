import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_model.dart';

class RentalOfferModel extends RentalOffer {
  RentalOfferModel(
    super.id,
    super.price,
    super.currency,
    super.conditions,
    super.status,
    super.visibility,
    super.userProfile,
    super.property,
  );

  factory RentalOfferModel.fromJson(Map<String, dynamic> json) {
    PropertyModel propertyModel = PropertyModel.fromJson(json["property"]);
    UserProfileModel userProfileModel =
        UserProfileModel.fromJson(json["property"]["profile"]);
    return RentalOfferModel(
      json["id"],
      json["amount"]["price"],
      json["amount"]["currency"],
      json["conditions"],
      json["status"],
      json["visibility"],
      userProfileModel,
      propertyModel,
    );
  }
}

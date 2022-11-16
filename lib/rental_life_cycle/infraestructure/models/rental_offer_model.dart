import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/models/property_model.dart';

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
    UserProfile userProfile = UserProfile(
        json["property"]["profile"]["name"],
        "",
        json["property"]["profile"]["surname"],
        json["property"]["profile"]["phone"]["number"],
        json["property"]["profile"]["phone"]["code"],
        "",
        json["property"]["profile"]["teamStatus"],
        json["property"]["profile"]["id"]);
    return RentalOfferModel(
      json["id"],
      json["amount"]["price"],
      json["amount"]["currency"],
      json["conditions"],
      json["status"],
      json["visibility"],
      userProfile,
      propertyModel,
    );
  }
}

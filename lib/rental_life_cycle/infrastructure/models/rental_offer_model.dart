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
    PropertyModel? propertydata() {
      if (json["property"] != null) {
        return PropertyModel.fromJson(json["property"]);
      } else {
        return null;
      }
    }

    UserProfileModel? userData() {
      if (json["property"]["profile"] != null) {
        return UserProfileModel.fromJson(json["property"]["profile"]);
      } else {
        return null;
      }
    }

    return RentalOfferModel(
      json["id"],
      json["amount"]["price"],
      json["amount"]["currency"],
      json["conditions"],
      json["status"],
      json["visibility"],
      userData(),
      propertydata(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "rentalOfferingResource": {
        "lifecycle": {"endAt": "2022-12-21"},
        "amount": {"price": price, "currency": currency},
        "conditions": "string"
      },
      "propertyResource": {
        "title": property!.tittle,
        "description": property!.description,
        "location": property!.location,
        "propertyType": property!.propertyType,
      }
    };
  }
}

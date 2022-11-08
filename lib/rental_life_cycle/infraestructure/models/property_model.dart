import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';

class PropertyModel extends Property {
  PropertyModel(
      super.description,
      super.tittle,
      super.currency,
      super.conditions,
      super.price,
      super.assets,
      super.propertyId,
      super.rentalOfferId,
      super.userProfile);

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
        json["property"]["description"],
        json["property"]["title"],
        json["amount"]["currency"],
        json["conditions"],
        json["amount"]["price"],
        json["assets"],
        json["property"]["id"],
        json["id"],
        json["profile"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "rentalOfferingResource": {
        "lifecycle": {"endAt": "2022-12-08T15:04:23.226Z"},
        "amount": {"price": price, "currency": currency},
        "conditions": conditions
      },
      "propertyResource": {"title": tittle, "description": description}
    };
  }
}

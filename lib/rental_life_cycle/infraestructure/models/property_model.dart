import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';

class PropertyModel extends Property {
  PropertyModel(super.description, super.tittle, super.currency,
      super.conditions, super.price);

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

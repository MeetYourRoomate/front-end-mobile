import 'package:meet_your_roommate/rental_life_cycle/domain/entity/property.dart';

class PropertyModel extends Property {
  PropertyModel(super.description, super.tittle);
  Map<String, dynamic> toJson() {
    return {"title": tittle, "description": description};
  }
}

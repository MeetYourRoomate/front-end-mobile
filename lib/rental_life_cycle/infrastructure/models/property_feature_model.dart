import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_feature.dart';

class PropertyFeatureModel extends PropertyFeature {
  PropertyFeatureModel(
    super.id,
    super.name,
    super.type,
  );
  factory PropertyFeatureModel.fromJson(Map<String, dynamic> json) {
    return PropertyFeatureModel(
      json["id"],
      json["feature"]["name"],
      json["feature"]["type"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type,
    };
  }
}

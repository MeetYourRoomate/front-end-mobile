import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_asset_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_feature_model.dart';

class PropertyModel extends Property {
  PropertyModel(
    super.id,
    super.tittle,
    super.description,
    super.propertyType,
    super.location,
    super.assets,
    super.features,
  );

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    List<PropertyAssetModel> listAssets = [];
    List<PropertyFeatureModel> listFeatures = [];
    if (json["assets"] != null) {
      listAssets = json["assets"]
          .map<PropertyAssetModel>((json) => PropertyAssetModel.fromJson(json))
          .toList();
    }
    if (json["propertyFeatureList"] != null) {
      listFeatures = json["propertyFeatureList"]
          .map<PropertyFeatureModel>(
              (json) => PropertyFeatureModel.fromJson(json))
          .toList();
    }

    return PropertyModel(
      json["id"],
      json["title"],
      json["description"],
      json["propertyType"],
      json["location"],
      listAssets,
      listFeatures,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": tittle,
      "description": description,
    };
  }
}

import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';

class PropertyAssetModel extends PropertyAsset {
  PropertyAssetModel(super.imageUrl, super.id);

  factory PropertyAssetModel.fromJson(Map<String, dynamic> json) {
    return PropertyAssetModel(
      json["urlImage"],
      json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "urlImage": imageUrl,
    };
  }
}

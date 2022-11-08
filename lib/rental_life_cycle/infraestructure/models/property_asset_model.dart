import 'package:meet_your_roommate_app/iam/infraestructure/models/user_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';

class PropertyAssetModel extends PropertyAsset {
  PropertyAssetModel(super.imageUrl);

  factory PropertyAssetModel.fromJson(Map<String, dynamic> json) {
    return PropertyAssetModel(json["urlImage"]);
  }

  Map<String, dynamic> toJson() {
    return {"urlImage": imageUrl};
  }
}

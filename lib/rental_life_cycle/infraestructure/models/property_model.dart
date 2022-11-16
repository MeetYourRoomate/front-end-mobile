import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/models/property_asset_model.dart';

class PropertyModel extends Property {
  PropertyModel(super.description, super.tittle, super.assets, super.id);

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    List<PropertyAssetModel> listAssets = json["assets"]
        .map<PropertyAssetModel>((json) => PropertyAssetModel.fromJson(json))
        .toList();
    return PropertyModel(
        json["description"], json["title"], listAssets, json["id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": tittle,
      "description": description,
    };
  }
}

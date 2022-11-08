import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';

abstract class PropertyAssetInterface {
  Future<List<PropertyAsset>> getProperties();
  Future<PropertyAsset> getProperty();
  Future<void> saveListPropertyAssets(List<PropertyAsset> assets, int id);
  Future<void> saveProperty(PropertyAsset propertyAsset, int id);
}

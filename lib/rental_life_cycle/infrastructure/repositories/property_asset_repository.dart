import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/property_asset_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_asset_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_asset_model.dart';

class PropertyAssetRepository implements PropertyAssetInterface {
  final PropertyAssetDataSource _assetDataSource;

  PropertyAssetRepository(this._assetDataSource);

  @override
  Future<List<PropertyAsset>> getProperties() {
    // TODO: implement getProperties
    throw UnimplementedError();
  }

  @override
  Future<PropertyAsset> getProperty() {
    // TODO: implement getProperty
    throw UnimplementedError();
  }

  @override
  Future<void> saveListPropertyAssets(
      List<PropertyAsset> assets, int id) async {
    List<PropertyAssetModel> listAssets = [];
    for (int i = 0; i < assets.length; i++) {
      listAssets.add(PropertyAssetModel(assets[i].imageUrl, null));
    }
    await _assetDataSource.saveListPropertyAssets(listAssets, id);
  }

  @override
  Future<void> saveProperty(PropertyAsset propertyAsset, int id) {
    // TODO: implement saveProperty
    throw UnimplementedError();
  }
}

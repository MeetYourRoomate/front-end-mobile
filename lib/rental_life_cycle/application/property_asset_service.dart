import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_asset_repository.dart';

class PropertyAssetService {
  final PropertyAssetRepository _assetRepository;

  PropertyAssetService(this._assetRepository);

  Future<void> saveListPropertyAssets(
      List<PropertyAsset> listAsset, int id) async {
    return _assetRepository.saveListPropertyAssets(listAsset, id);
  }
}

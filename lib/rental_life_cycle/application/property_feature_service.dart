import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_feature.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_feature_repository.dart';

class PropertyFeatureService {
  final PropertyFeatureRepository _propertyFeatureRepository;

  PropertyFeatureService(this._propertyFeatureRepository);

  Future<void> saveListPropertyAssets(
      List<PropertyFeature> features, int id) async {
    await _propertyFeatureRepository.saveListPropertyAssets(features, id);
  }
}

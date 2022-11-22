import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_feature.dart';

abstract class PropertyFeatureInterface {
  Future<List<PropertyFeature>> getProperties();
  Future<PropertyFeature> getProperty();
  Future<void> saveListPropertyAssets(List<PropertyFeature> features, int id);
  Future<void> saveProperty(PropertyFeature propertyFeature, int id);
}

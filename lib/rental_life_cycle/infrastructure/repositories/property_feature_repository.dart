import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_feature.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/peroperty_feature_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_feature_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_feature_model.dart';

class PropertyFeatureRepository implements PropertyFeatureInterface {
  final PropertyFeatureDataSource _propertyFeatureDataSource;

  PropertyFeatureRepository(this._propertyFeatureDataSource);
  @override
  Future<List<PropertyFeature>> getProperties() {
    // TODO: implement getProperties
    throw UnimplementedError();
  }

  @override
  Future<PropertyFeature> getProperty() {
    // TODO: implement getProperty
    throw UnimplementedError();
  }

  @override
  Future<void> saveListPropertyAssets(
      List<PropertyFeature> features, int id) async {
    List<PropertyFeatureModel> listFeatures = [];
    for (int i = 0; i < features.length; i++) {
      listFeatures
          .add(PropertyFeatureModel(null, features[i].name, features[i].type));
    }
    await _propertyFeatureDataSource.saveListFeatures(listFeatures, id);
  }

  @override
  Future<void> saveProperty(PropertyFeature propertyFeature, int id) {
    // TODO: implement saveProperty
    throw UnimplementedError();
  }
}

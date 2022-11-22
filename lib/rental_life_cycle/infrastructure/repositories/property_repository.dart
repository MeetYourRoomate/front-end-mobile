import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/property_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/property_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_model.dart';

class PropertyRepository implements PropertyInterface {
  final PropertyDataSource _propertyDataSource;

  PropertyRepository(this._propertyDataSource);

  @override
  Future<List<Property>> getProperties() {
    // TODO: implement getProperties
    throw UnimplementedError();
  }

  @override
  Future<Property> getProperty() {
    // TODO: implement getProperty
    throw UnimplementedError();
  }

  @override
  Future<Property> saveProperty(Property property, String uid) async {
    PropertyModel propertyModel = PropertyModel(
        property.id,
        property.tittle,
        property.description,
        property.propertyType,
        property.location,
        property.assets,
        property.features);
    return await _propertyDataSource.saveProperty(propertyModel, uid);
  }
}

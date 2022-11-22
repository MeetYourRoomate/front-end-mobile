import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/property_repository.dart';

class PropertyService {
  final PropertyRepository _propertyRepository;

  PropertyService(this._propertyRepository);

  Future<Property> saveProperty(Property property, String uid) async {
    return _propertyRepository.saveProperty(property, uid);
  }
}

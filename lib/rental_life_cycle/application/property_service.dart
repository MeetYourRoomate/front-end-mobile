import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/repositories/property_repository.dart';

class PropertyService {
  final PropertyRepository _propertyRepository = PropertyRepository();

  Future<void> saveProperty(Property property, String uid) async {
    return _propertyRepository.saveProperty(property, uid);
  }
}

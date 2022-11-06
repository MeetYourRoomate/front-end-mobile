import 'package:meet_your_roommate/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate/rental_life_cycle/infraestructure/repositories/propertyRepository.dart';

class PropertyService {
  final PropertyRepository _propertyRepository = PropertyRepository();

  Future<void> saveProperty(Property user, String uid) async {
    return _propertyRepository.saveProperty(user, uid);
  }
}

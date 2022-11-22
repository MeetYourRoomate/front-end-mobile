import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';

abstract class PropertyInterface {
  Future<List<Property>> getProperties();
  Future<Property> getProperty();
  Future<Property> saveProperty(Property property, String uid);
}

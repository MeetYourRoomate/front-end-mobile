import 'dart:convert';
import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_model.dart';

class PropertyDataSource {
  Future<PropertyModel> saveProperty(
      PropertyModel propertyModel, String uid) async {
    final bodyData = jsonEncode(propertyModel.toJson());

    final response = await post(
        Uri.parse(
          "$baseUrl/properties?userid=$uid",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyData);
    if (response.statusCode == 200) {
      print(response.body);
      return PropertyModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      print(response.body);
      throw Exception("fallo la llamada");
    }
  }

  Future<List<PropertyModel>> getProperties() async {
    final response = await get(
      Uri.parse("$baseUrl/rentaloffers/all"),
    );

    if (response.statusCode == 200) {
      List<PropertyModel> listProperties = [];
      for (int i = 0; i < response.body.length; i++) {
        listProperties.add(PropertyModel.fromJson(jsonDecode(response.body)));
      }
      return listProperties;
    } else {
      print(response.body);
      throw Exception("fallo la llamada");
    }
  }
}

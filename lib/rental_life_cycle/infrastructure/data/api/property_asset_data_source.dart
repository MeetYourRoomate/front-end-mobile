import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/property_asset_model.dart';

class PropertyAssetDataSource {
  Future<void> saveListPropertyAssets(
      List<PropertyAssetModel> assets, int id) async {
    final bodyData = [];
    for (int i = 0; i < assets.length; i++) {
      bodyData.add(assets[i].toJson());
    }

    final response = await post(
      Uri.parse("$baseUrl/properties/$id/assets"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bodyData),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
      throw Exception("fallo la llamada");
    }
  }
}

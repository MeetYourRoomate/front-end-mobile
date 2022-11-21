import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_request_model.dart';

class RentalRequestDataSource {
  Future<void> saveRentalRequest(RentalRequestModel rentalRequestModel) async {
    final response = await post(
      Uri.parse("$baseUrl/rental/request"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(rentalRequestModel.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
      throw Exception("fallo la llamada");
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_request_model.dart';

class RentalRequestDataSource {
  Future<void> saveRentalRequest(RentalRequestModel rentalRequestModel) async {
    final response = await post(
      Uri.parse("$baseUrl/requests"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(rentalRequestModel.toJson()),
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<List<RentalRequestModel>> getRentalRequestsByLessorId(
      String uid) async {
    final response = await get(
      Uri.parse("$baseUrl/users/lessor/$uid/request"),
    );

    if (response.statusCode == 200) {
      List<RentalRequestModel> listVacio = [];
      if ((jsonDecode(response.body)["resource"]).isEmpty) {
        return listVacio;
      }
      final parsed =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();

      List<RentalRequestModel> listRequest = parsed
          .map<RentalRequestModel>((json) => RentalRequestModel.fromJson(json))
          .toList();

      return listRequest;
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<List<RentalRequestModel>> getRentalRequestsByUserId(String uid) async {
    final response = await get(
      Uri.parse("$baseUrl/users/$uid/requests"),
    );

    if (response.statusCode == 200) {
      List<RentalRequestModel> listVacio = [];
      if ((jsonDecode(response.body)["resource"]).isEmpty) {
        return listVacio;
      }
      final parsed =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();
      List<RentalRequestModel> listRequest = [];
      listRequest = parsed
          .map<RentalRequestModel>((json) => RentalRequestModel.fromJson(json))
          .toList();

      return listRequest;
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<RentalRequestModel> acceptRentalRequest(int id) async {
    final response = await put(
        Uri.parse(
          "$baseUrl/requests/$id/accept",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return RentalRequestModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<RentalRequestModel> declineRentalRequest(int id) async {
    final response = await put(
        Uri.parse(
          "$baseUrl/requests/$id/decline",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return RentalRequestModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }
}

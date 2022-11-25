import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/models/roommate_request_model.dart';

class RoomateRequestDataSource {
  Future<RoommateRequestModel> declineRequest(int requestId) async {
    final response = await post(
      Uri.parse("$baseUrl/roommate/request/$requestId/decline"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return RoommateRequestModel.fromJson(
          jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<RoommateRequestModel> acceptRequest(int requestId) async {
    final response = await post(
      Uri.parse("$baseUrl/roommate/request/$requestId/accept"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return RoommateRequestModel.fromJson(
          jsonDecode(response.body)["resource"]);
    } else {
      print(response.body);
      throw Exception("fallo la llamada");
    }
  }

  Future<RoommateRequestModel> saveRoommaRequest(
      String requestor, int requested) async {
    final response = await post(
      Uri.parse(
        "$baseUrl/users/requestor/$requestor/requested/$requested/roommate/request",
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return RoommateRequestModel.fromJson(
          jsonDecode(response.body)["resource"]);
    } else {
      print(response.body);
      throw Exception("fallo la llamada");
    }
  }

  Future<List<RoommateRequestModel>> getAllRequestToUser(String uid) async {
    final response =
        await get(Uri.parse("$baseUrl/users/$uid/roommate/requestors"));
    if (response.statusCode == 200) {
      final data =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();
      return data
          .map<RoommateRequestModel>(
              (json) => RoommateRequestModel.fromJson(json))
          .toList();
    } else {
      throw "Error";
    }
  }

  Future<List<RoommateRequestModel>> getAllRequestMadeByUser(String uid) async {
    final response =
        await get(Uri.parse("$baseUrl/users/$uid/roommate/requested"));
    if (response.statusCode == 200) {
      final data =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();
      return data
          .map<RoommateRequestModel>(
              (json) => RoommateRequestModel.fromJson(json))
          .toList();
    } else {
      throw "Error";
    }
  }
}

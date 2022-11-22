import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/models/roommate_request_model.dart';

class RoomateRequestDataSource {
  Future<RoommateRequestModel> declineRequest(String requestId) async {
    final response =
        await get(Uri.parse("$baseUrl/roommate/request/$requestId/decline"));

    if (response.statusCode == 200) {
      return RoommateRequestModel.fromJson(
          jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<RoommateRequestModel> acceptRequest(String requestId) async {
    final response =
        await get(Uri.parse("$baseUrl/roommate/request/$requestId/accept"));

    if (response.statusCode == 200) {
      return RoommateRequestModel.fromJson(
          jsonDecode(response.body)["resource"]);
    } else {
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
      throw Exception("fallo la llamada");
    }
  }
}

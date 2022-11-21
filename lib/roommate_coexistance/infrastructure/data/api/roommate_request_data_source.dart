import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/infrastructure/models/roommate_request_model.dart';

class RoomateRequestDataSource {
  Future<RoommateRequestModel> declineRequest(String requestId) async {
    final response =
        await get(Uri.parse("$baseUrl/oommate/request/$requestId/decline"));

    if (response.statusCode == 200) {
      return RoommateRequestModel.fromJson(
          jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<RoommateRequestModel> acceptRequest(String requestId) async {
    final response =
        await get(Uri.parse("$baseUrl/oommate/request/$requestId/accept"));

    if (response.statusCode == 200) {
      return RoommateRequestModel.fromJson(
          jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }
}

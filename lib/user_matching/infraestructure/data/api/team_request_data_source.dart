import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/models/team_request_model.dart';

class TeamRequestDataSource {
  Future<List<TeamRequestModel>> getAllTeamRequestByTeamId(int teamId) async {
    final response = await get(Uri.parse("$baseUrl/teams/$teamId/request"));

    if (response.statusCode == 200) {
      final data =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();

      return data
          .map<TeamRequestModel>((json) => TeamRequestModel.fromJson(json))
          .toList();
    } else {
      throw "Error";
    }
  }

  Future<TeamRequestModel> acceptTeamRequest(
      String uid, String teamRequestId) async {
    final response = await put(
        Uri.parse("$baseUrl/users/$uid/teams/requests/$teamRequestId/accept"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return TeamRequestModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<TeamRequestModel> declineRentalRequest(
      String uid, String teamRequestId) async {
    final response = await put(
        Uri.parse("$baseUrl/users/$uid/teams/requests/$teamRequestId/decline"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return TeamRequestModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }
}

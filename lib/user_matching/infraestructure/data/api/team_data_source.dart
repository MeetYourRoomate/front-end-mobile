import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/models/team_model.dart';

class TeamDataSource {
  Future<Team?> getTeamByUserId(String uid) async {
    final response = await get(Uri.parse("$baseUrl/users/$uid/teams"));

    if (response.statusCode == 200) {
      return TeamModel.fromJson(jsonDecode(response.body)["resource"]);
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception("Error");
    }
  }

  Future<List<TeamModel>> getAllTeam() async {
    final response = await get(Uri.parse("$baseUrl/teams"));

    if (response.statusCode == 200) {
      final data =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();
      return data.map<TeamModel>((json) => TeamModel.fromJson(json)).toList();
    } else {
      throw "Error";
    }
  }
}

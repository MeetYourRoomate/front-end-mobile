import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/models/duty_model.dart';

class DutyDataSource {
  Future<List<DutyModel>> getAllDutiesByTeamId(int id) async {
    final response = await get(Uri.parse("$baseUrl/teams/$id/duties"));

    if (response.statusCode == 200) {
      final data =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();

      return data.map<DutyModel>((json) => DutyModel.fromJson(json)).toList();
    } else {
      throw "Error";
    }
  }
}

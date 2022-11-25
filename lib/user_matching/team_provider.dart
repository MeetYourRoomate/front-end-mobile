import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/user_matching/application/team_service.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/team_data_source.dart';

class TeamProvider with ChangeNotifier {
  Team? _team;

  Team? get team => _team;

  Future<void> setTeam(String uid) async {
    TeamService teamService = locator<TeamService>();
    final data = await teamService.getTeamByUserId(uid);

    _team = data;

    notifyListeners();
  }
}

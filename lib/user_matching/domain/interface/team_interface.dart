import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';

abstract class TeamInterface {
  Future<Team?> getTeamByUserId(String uid);
  Future<List<Team>> getAllTeams();
}

import 'package:meet_your_roommate_app/user_matching/domain/entity/team_request.dart';

abstract class TeamRequestInterface {
  Future<TeamRequest> createTeamRequest(String uid, int teamId);
  Future<List<TeamRequest>> getAllTeamRequestByTeamId(int teamId);
  Future<TeamRequest> declineTeamRequest(String uid, String teamRequestId);
  Future<TeamRequest> acceptTeamRequest(String uid, String teamRequestId);
}

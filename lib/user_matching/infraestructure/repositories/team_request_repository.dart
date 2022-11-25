import 'package:meet_your_roommate_app/user_matching/domain/entity/team_request.dart';
import 'package:meet_your_roommate_app/user_matching/domain/interface/team_request_interface.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/team_request_data_source.dart';

class TeamRequestRepository implements TeamRequestInterface {
  final TeamRequestDataSource teamRequestDataSource;

  TeamRequestRepository(this.teamRequestDataSource);

  @override
  Future<TeamRequest> acceptTeamRequest(
      String uid, String teamRequestId) async {
    return await teamRequestDataSource.acceptTeamRequest(uid, teamRequestId);
  }

  @override
  Future<TeamRequest> createTeamRequest(String uid, int teamId) {
    // TODO: implement createTeamRequest
    throw UnimplementedError();
  }

  @override
  Future<TeamRequest> declineTeamRequest(
      String uid, String teamRequestId) async {
    return await teamRequestDataSource.declineRentalRequest(uid, teamRequestId);
  }

  @override
  Future<List<TeamRequest>> getAllTeamRequestByTeamId(int teamId) async {
    return await teamRequestDataSource.getAllTeamRequestByTeamId(teamId);
  }
}

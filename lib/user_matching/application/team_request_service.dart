import 'package:meet_your_roommate_app/user_matching/domain/entity/team_request.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/team_request_repository.dart';

class TeamRequestService {
  final TeamRequestRepository teamRequestRepository;

  TeamRequestService(this.teamRequestRepository);

  Future<TeamRequest> acceptTeamRequest(
      String uid, String teamRequestId) async {
    return await teamRequestRepository.acceptTeamRequest(uid, teamRequestId);
  }

  Future<TeamRequest> declineTeamRequest(
      String uid, String teamRequestId) async {
    return await teamRequestRepository.declineTeamRequest(uid, teamRequestId);
  }

  Future<List<TeamRequest>> getAllTeamRequestByTeamId(int teamId) async {
    return await teamRequestRepository.getAllTeamRequestByTeamId(teamId);
  }
}

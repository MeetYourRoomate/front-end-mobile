import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/team_repository.dart';

class TeamService {
  final TeamRepository teamRepository;

  TeamService(this.teamRepository);

  Future<Team?> getTeamByUserId(String uid) async {
    return await teamRepository.getTeamByUserId(uid);
  }

  Future<List<Team>> getAllTeams() async {
    return await teamRepository.getAllTeams();
  }
}

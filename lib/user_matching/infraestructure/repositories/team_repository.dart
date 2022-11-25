import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';
import 'package:meet_your_roommate_app/user_matching/domain/interface/team_interface.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/team_data_source.dart';

class TeamRepository implements TeamInterface {
  final TeamDataSource teamDataSource;

  TeamRepository(this.teamDataSource);

  @override
  Future<Team?> getTeamByUserId(String uid) async {
    return await teamDataSource.getTeamByUserId(uid);
  }

  @override
  Future<List<Team>> getAllTeams() async {
    return await teamDataSource.getAllTeam();
  }
}

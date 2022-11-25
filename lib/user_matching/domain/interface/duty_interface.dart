import 'package:meet_your_roommate_app/user_matching/domain/entity/duty.dart';

abstract class DutyInterface {
  Future<List<Duty>> getAllDutiesByTeamId(int id);
}

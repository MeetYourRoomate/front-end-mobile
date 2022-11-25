import 'package:meet_your_roommate_app/user_matching/domain/entity/duty.dart';
import 'package:meet_your_roommate_app/user_matching/domain/interface/duty_interface.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/duty_data_source.dart';

class DutyRepository implements DutyInterface {
  final DutyDataSource dutyDataSource;

  DutyRepository(this.dutyDataSource);

  @override
  Future<List<Duty>> getAllDutiesByTeamId(int id) async {
    return await dutyDataSource.getAllDutiesByTeamId(id);
  }
}

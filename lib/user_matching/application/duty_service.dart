import 'package:meet_your_roommate_app/user_matching/domain/entity/duty.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/duty_repository.dart';

class DutyService {
  final DutyRepository dutyRepository;

  DutyService(this.dutyRepository);

  Future<List<Duty>> getAllDutiesByTeamId(int id) async {
    return await dutyRepository.getAllDutiesByTeamId(id);
  }
}

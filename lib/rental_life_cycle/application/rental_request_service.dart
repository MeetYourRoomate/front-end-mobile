import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/rental_request_repository.dart';

class RentalRequestService {
  final RentalRequestRepository _rentalRequestRepository;

  RentalRequestService(this._rentalRequestRepository);

  Future<void> saveRentalRequest(RentalRequest rentalRequest) async {
    await _rentalRequestRepository.saveRentalRequest(rentalRequest);
  }
}

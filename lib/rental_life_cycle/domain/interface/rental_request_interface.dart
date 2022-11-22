import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';

abstract class RentalRequestInterface {
  Future<List<RentalRequest>> getRentalRequestsByUserId(String uid);

  Future<List<RentalRequest>> getRentalRequestsByLessorId(String uid);
  Future<RentalRequest> declineRentalRequest(int id);
  Future<RentalRequest> acceptRentalRequest(int id);
  Future<void> saveRentalRequest(RentalRequest rentalRequest);
}

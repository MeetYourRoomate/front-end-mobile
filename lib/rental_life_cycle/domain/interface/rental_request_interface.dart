import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';

abstract class RentalRequestInterface {
  Future<List<RentalRequest>> getRentalRequests();
  Future<RentalRequest> getRentalRequest();
  Future<void> saveRentalRequest(RentalRequest rentalRequest);
}

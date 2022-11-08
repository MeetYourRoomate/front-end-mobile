import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/rental_request_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/data/api/rental_request_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/models/rental_request_model.dart';

class RentalRequestRepository implements RentalRequestInterface {
  final RentalRequestDataSource _rentalRequestDataSource =
      RentalRequestDataSource();

  @override
  Future<List<RentalRequest>> getRentalRequestsByOfferId(int uid) {
    // TODO: implement getRentalRequestsByOfferId
    throw UnimplementedError();
  }

  @override
  Future<List<RentalRequest>> getRentalRequestsByUserId(String uid) {
    // TODO: implement getRentalRequestsByUserId
    throw UnimplementedError();
  }

  @override
  Future<void> saveRentalRequest(RentalRequest rentalRequest) async {
    RentalRequestModel _rentalRequestModel = RentalRequestModel(
        rentalRequest.message,
        rentalRequest.userId,
        rentalRequest.rentalOfferId);
    await _rentalRequestDataSource.saveRentalRequest(_rentalRequestModel);
  }
}

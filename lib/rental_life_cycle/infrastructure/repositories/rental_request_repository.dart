import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/rental_request_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_request_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_request_model.dart';

class RentalRequestRepository implements RentalRequestInterface {
  final RentalRequestDataSource _rentalRequestDataSource;

  RentalRequestRepository(this._rentalRequestDataSource);

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
    RentalRequestModel rentalRequestModel = RentalRequestModel(
      rentalRequest.id,
      rentalRequest.status,
      rentalRequest.message,
      rentalRequest.studentProfile,
      rentalRequest.rentalOffer,
      rentalRequest.userId,
      rentalRequest.rentalOfferId,
    );
    await _rentalRequestDataSource.saveRentalRequest(rentalRequestModel);
  }
}

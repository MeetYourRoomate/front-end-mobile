import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/rental_request_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_request_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_request_model.dart';

class RentalRequestRepository implements RentalRequestInterface {
  final RentalRequestDataSource _rentalRequestDataSource;

  RentalRequestRepository(this._rentalRequestDataSource);

  @override
  Future<List<RentalRequest>> getRentalRequestsByLessorId(String uid) async {
    return await _rentalRequestDataSource.getRentalRequestsByLessorId(uid);
  }

  @override
  Future<List<RentalRequest>> getRentalRequestsByUserId(String uid) async {
    return await _rentalRequestDataSource.getRentalRequestsByUserId(uid);
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

  @override
  Future<RentalRequest> acceptRentalRequest(int id) async {
    return await _rentalRequestDataSource.acceptRentalRequest(id);
  }

  @override
  Future<RentalRequest> declineRentalRequest(int id) async {
    return await _rentalRequestDataSource.declineRentalRequest(id);
  }
}

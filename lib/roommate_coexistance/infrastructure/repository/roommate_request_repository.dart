import 'package:meet_your_roommate_app/roommate_coexistance/domain/entity/roomate_request.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/domain/interface/roommate_request_interface.dart';
import 'package:meet_your_roommate_app/roommate_coexistance/infrastructure/data/api/roommate_request_data_source.dart';

class RoommateReuestRepository implements RoommateRequestInterface {
  final RoomateRequestDataSource roomateRequestDataSource;

  RoommateReuestRepository(this.roomateRequestDataSource);

  @override
  Future<RoommateRequest> acceptRequest(String requestId) {
    // TODO: implement acceptRequest
    throw UnimplementedError();
  }

  @override
  Future<RoommateRequest> declineRequest(String requestId) {
    // TODO: implement declineRequest
    throw UnimplementedError();
  }
}

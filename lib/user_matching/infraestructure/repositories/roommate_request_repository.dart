import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';
import 'package:meet_your_roommate_app/user_matching/domain/interface/roommate_request_interface.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/data/api/roommate_request_data_source.dart';

class RoomateRequestRepository implements RoommateRequestInterface {
  final RoomateRequestDataSource roomateRequestDataSource;

  RoomateRequestRepository(this.roomateRequestDataSource);

  @override
  Future<RoommateRequest> acceptRequest(int requestId) async {
    return await roomateRequestDataSource.acceptRequest(requestId);
  }

  @override
  Future<RoommateRequest> declineRequest(int requestId) async {
    return await roomateRequestDataSource.declineRequest(requestId);
  }

  @override
  Future<RoommateRequest> createRoommateRequest(
      String requestor, int requested) async {
    return await roomateRequestDataSource.saveRoommaRequest(
        requestor, requested);
  }

  @override
  Future<List<RoommateRequest>> getAllRequestMadeByUser(String uid) async {
    return await roomateRequestDataSource.getAllRequestMadeByUser(uid);
  }

  @override
  Future<List<RoommateRequest>> getAllRequestToUser(String uid) async {
    return await roomateRequestDataSource.getAllRequestToUser(uid);
  }
}

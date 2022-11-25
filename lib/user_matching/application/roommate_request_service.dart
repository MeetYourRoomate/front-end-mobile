import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/repositories/roommate_request_repository.dart';

class RoommateRequestService {
  final RoomateRequestRepository roomateRequestRepository;

  RoommateRequestService(this.roomateRequestRepository);

  Future<RoommateRequest> acceptRequest(int requestId) async {
    return await roomateRequestRepository.acceptRequest(requestId);
  }

  Future<RoommateRequest> declineRequest(int requestId) async {
    return await roomateRequestRepository.declineRequest(requestId);
  }

  Future<RoommateRequest> createRoommateRequest(
      String requestor, int requested) async {
    return await roomateRequestRepository.createRoommateRequest(
        requestor, requested);
  }

  Future<List<RoommateRequest>> getAllRequestMadeByUser(String uid) async {
    return await roomateRequestRepository.getAllRequestMadeByUser(uid);
  }

  Future<List<RoommateRequest>> getAllRequestToUser(String uid) async {
    return await roomateRequestRepository.getAllRequestToUser(uid);
  }
}

import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';

abstract class RoommateRequestInterface {
  Future<RoommateRequest> declineRequest(String requestId);
  Future<RoommateRequest> acceptRequest(String requestId);
  Future<RoommateRequest> createRoommateRequest(
      String requestor, int requested);
  Future<List<RoommateRequest>> getAllRequestMadeByUser(String uid);
  Future<List<RoommateRequest>> getAllRequestToUser(String uid);
}

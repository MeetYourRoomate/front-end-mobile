import 'package:meet_your_roommate_app/roommate_coexistance/domain/entity/roomate_request.dart';

abstract class RoommateRequestInterface {
  Future<RoommateRequest> declineRequest(String requestId);
  Future<RoommateRequest> acceptRequest(String requestId);
}

import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/roomate_request.dart';

class RoommateRequestModel extends RoommateRequest {
  RoommateRequestModel(
    super.id,
    super.status,
    super.studentRequestor,
    super.studentRequested,
  );
  factory RoommateRequestModel.fromJson(Map<String, dynamic> json) {
    UserProfileModel studentRequestor =
        UserProfileModel.fromJson(json["studentRequestor"]);
    UserProfileModel studentRequested =
        UserProfileModel.fromJson(json["studentRequested"]);

    return RoommateRequestModel(
      json["id"],
      json["status"],
      studentRequestor,
      studentRequested,
    );
  }
}

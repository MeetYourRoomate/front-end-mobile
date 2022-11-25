import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/team_request.dart';

class TeamRequestModel extends TeamRequest {
  TeamRequestModel(
    super.id,
    super.status,
    super.studentRequestor,
  );

  factory TeamRequestModel.fromJson(Map<String, dynamic> json) {
    UserProfile userProfile =
        UserProfileModel.fromJson(json["studentRequestor"]);

    return TeamRequestModel(
      json["id"],
      json["status"],
      userProfile,
    );
  }
}

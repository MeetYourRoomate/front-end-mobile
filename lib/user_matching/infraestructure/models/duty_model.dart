import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/duty.dart';

class DutyModel extends Duty {
  DutyModel(
    super.id,
    super.title,
    super.description,
    super.status,
    super.dateLine,
    super.listRoommate,
  );

  factory DutyModel.fromJson(Map<String, dynamic> json) {
    List<UserProfileModel> listRoommate = [];

    if (json["roommateList"] != null) {
      listRoommate = json["roommateList"]
          .map<UserProfileModel>(
              (json) => UserProfileModel.fromJson(json["profile"]))
          .toList();
    }

    return DutyModel(
      json["id"],
      json["title"],
      json["description"],
      json["status"],
      json["dateline"],
      listRoommate,
    );
  }
}

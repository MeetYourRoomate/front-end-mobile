import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/duty.dart';
import 'package:meet_your_roommate_app/user_matching/domain/entity/team.dart';
import 'package:meet_your_roommate_app/user_matching/infraestructure/models/duty_model.dart';

class TeamModel extends Team {
  TeamModel(
    super.id,
    super.name,
    super.listRoommates,
    super.listDuties,
  );

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    List<UserProfile> listRoommates = [];
    List<Duty> listDuties = [];
    if (json["roommates"] != null) {
      listRoommates = json["roommates"]
          .map<UserProfileModel>(
              (json) => UserProfileModel.fromJson(json["profile"]))
          .toList();
    }
    if (json["duties"] != null) {
      listDuties = json["duties"]
          .map<DutyModel>((json) => DutyModel.fromJson(json))
          .toList();
    }

    return TeamModel(
      json["id"],
      json["name"],
      listRoommates,
      listDuties,
    );
  }
}

import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel(super.name, super.photoUrl, super.surname, super.phoneNumer,
      super.phoneCode, super.description, super.teamStatus, super.id);
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      json["resource"]["name"],
      "photoUrl",
      json["resource"]["surname"],
      json["resource"]["phone"]["number"],
      json["resource"]["phone"]["code"],
      "description",
      json["resource"]["teamStatus"],
      json["resource"]["id"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "phone": {
        "number": phoneNumber,
        "code": phoneCode,
      }
    };
  }
}

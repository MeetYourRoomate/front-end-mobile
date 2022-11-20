import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel(
    super.id,
    super.name,
    super.surname,
    super.photoUrl,
    super.gender,
    super.about,
    super.teamStatus,
    super.country,
    super.city,
    super.age,
    super.phoneNumber,
    super.phoneCode,
  );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      json["id"],
      json["name"],
      json["surname"],
      json["photoUrl"],
      json["gender"],
      json["about"],
      json["teamStatus"],
      json["country"],
      json["city"],
      json["age"],
      json["phone"]["number"],
      json["phone"]["code"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "photoUrl": photoUrl,
      "gender": gender,
      "about": about,
      "country": country,
      "city": city,
      "age": age,
      "phone": {
        "number": phoneNumber,
        "code": phoneCode,
      }
    };
  }
}

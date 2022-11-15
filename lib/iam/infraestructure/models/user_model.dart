import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';

class UserModel extends UserAuth {
  UserModel(super.id, super.email, super.active, super.role);
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json["resource"]["id"],
      json["resource"]["email"]["adress"],
      json["resource"]["active"],
      json["resource"]["role"]["name"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": {"adress": email}
    };
  }
}

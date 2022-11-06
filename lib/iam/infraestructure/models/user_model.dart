import 'package:meet_your_roommate/iam/domain/entity/user.dart';

class UserModel extends UserAuth {
  UserModel(super.id, super.email, super.active, super.role);
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json["id"],
      json["email"]["adress"],
      json["active"],
      json["role"]["name"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": {"adress": email}
    };
  }
}

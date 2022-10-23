import 'package:meet_your_roommate/iam/domain/entity/user.dart';

class UserModel extends User {
  UserModel(super.id, super.title);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json["id"],
      json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
    };
  }
}

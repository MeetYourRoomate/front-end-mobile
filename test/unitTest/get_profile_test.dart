import 'package:flutter_test/flutter_test.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';

void main() async {
  initIjectable();
  UserProfileService userProfileService = locator<UserProfileService>();

  UserProfile userProfile = await userProfileService
      .getUserProfileByUserId("PnC68MOzbZeIAiLtdljhqL8be7F3");
  UserProfileModel userProfileModel = UserProfileModel(
    1,
    "Denilson Ramirez",
    "xxxxxx",
    "https://lh3.googleusercontent.com/a/ALm5wu1yBpWxNkuQzfbVwZtE9Nov7KmHd8ZyLk_tmvQN=s96-c",
    "xxxxx",
    "",
    "WITHOUTTEAM",
    "xxxxxx",
    "xxxxxx",
    0,
    "xxxxxxxxx",
    "+51",
  );
  test("get use by user id and valid id", () async {
    expect(userProfile.id, userProfileModel.id);
  });
  test("get use by user id and valid name", () async {
    expect(userProfile.name, userProfileModel.name);
  });
  test("get use by user id and valid surname", () async {
    expect(userProfile.surname, userProfileModel.surname);
  });
  test("get use by user id and valid phoneCode", () async {
    expect(userProfile.phoneCode, userProfileModel.phoneCode);
  });
  test("get use by user id and valid photoUrl", () async {
    expect(userProfile.photoUrl, userProfileModel.photoUrl);
  });
}

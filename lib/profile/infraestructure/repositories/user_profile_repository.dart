import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/profile/domain/interface/user_profile_interface.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/data/api/user_profile_data_source.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';

class UserProfileRepository implements UserProfileInterface {
  final UserProfileDataSource _userProfileDataSource;

  UserProfileRepository(this._userProfileDataSource);

  @override
  Future<List<UserProfile>> getAllUsersProfilesWithoutTeam(String uid) async {
    return await _userProfileDataSource.getAllUsersProfilesWithoutTeam(uid);
  }

  @override
  Future<UserProfile> getUserProfileById(int id) {
    // TODO: implement getUserProfileById
    throw UnimplementedError();
  }

  @override
  Future<UserProfile> getUserProfileByUserId(String uid) async {
    final UserProfile userProfile =
        await _userProfileDataSource.getUserProfileByUserId(uid);
    return userProfile;
  }

  @override
  Future<void> saveUserProfile(UserProfile userProfile, String uid) async {
    UserProfileModel userProfileModel = UserProfileModel(
      userProfile.id,
      userProfile.name,
      userProfile.surname,
      userProfile.photoUrl,
      userProfile.gender,
      userProfile.about,
      userProfile.teamStatus,
      userProfile.country,
      userProfile.city,
      userProfile.age,
      userProfile.phoneNumber,
      userProfile.phoneCode,
    );
    await _userProfileDataSource.saveUserProfile(userProfileModel, uid);
  }
}

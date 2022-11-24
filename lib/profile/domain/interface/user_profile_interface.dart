import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';

abstract class UserProfileInterface {
  Future<List<UserProfile>> getAllUsersProfilesWithoutTeam(String uid);
  Future<void> saveUserProfile(UserProfile userProfile, String uid);
  Future<UserProfile> getUserProfileById(int id);
  Future<UserProfile> getUserProfileByUserId(String uid);
}

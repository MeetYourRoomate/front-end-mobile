import 'package:meet_your_roommate_app/profile/domain/entity/user_profile.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/repositories/user_profile_repository.dart';

class UserProfileService {
  final UserProfileRepository _userProfileRepository;

  UserProfileService(this._userProfileRepository);

  Future<UserProfile> getUserProfileByUserId(String uid) async {
    return await _userProfileRepository.getUserProfileByUserId(uid);
  }

  Future<void> saveUserProfile(UserProfile userProfile, String uid) async {
    await _userProfileRepository.saveUserProfile(userProfile, uid);
  }

  Future<List<UserProfile>> getAllUsersProfilesWithoutTeam(String uid) async {
    return await _userProfileRepository.getAllUsersProfilesWithoutTeam(uid);
  }
}

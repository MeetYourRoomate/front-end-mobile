import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';

class UserProfileDataSource {
  Future<void> saveUserProfile(
      UserProfileModel userProfileModel, String uid) async {
    final bodyData = jsonEncode(userProfileModel.toJson());

    final response = await post(
      Uri.parse(
          "https://meetyouroommate-backend.herokuapp.com/api/v1/profiles?userId=$uid"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyData,
    );
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(UserProfileModel.fromJson(jsonDecode(response.body)));
    } else if (response.statusCode == 409) {
      print(response.body);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<UserProfileModel> getUserProfileByUserId(String uid) async {
    final response = await get(Uri.parse(
        "https://meetyouroommate-backend.herokuapp.com/api/v1/users/$uid/profiles"));
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Call Failed");
    }
  }
}

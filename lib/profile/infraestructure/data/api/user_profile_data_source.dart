import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';

class UserProfileDataSource {
  Future<UserProfileModel> saveUserProfile(
      UserProfileModel userProfileModel, String uid) async {
    final bodyData = jsonEncode(userProfileModel.toJson());

    final respondseValid = await get(Uri.parse("$baseUrl/users/$uid/profiles"));

    if (respondseValid.statusCode == 200) {
      print("ususairo existe");
      print(respondseValid.body);
      return UserProfileModel.fromJson(
          jsonDecode(respondseValid.body)["resource"]);
    }
    final response = await post(
      Uri.parse("$baseUrl/profiles?userId=$uid"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyData,
    );
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<UserProfileModel> getUserProfileByUserId(String uid) async {
    final response = await get(Uri.parse("$baseUrl/users/$uid/profiles"));
    if (response.statusCode == 200) {
      print(response.body);
      return UserProfileModel.fromJson(jsonDecode(response.body)["resource"]);
    } else if (response.statusCode == 404) {
      UserProfileModel user =
          UserProfileModel(-1, "", "", "", "", "", "", "", "", 0, "", "");
      return user;
    } else {
      print(response.body);
      throw Exception("Call Failed");
    }
  }

  Future<List<UserProfileModel>> getAllUsersProfilesWithoutTeam(
      String uid) async {
    final response =
        await get(Uri.parse("$baseUrl/users/$uid/profiles/without/team"));

    if (response.statusCode == 200) {
      final parsed =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();

      //print(jsonDecode(response.body)["resource"][0]);
      List<UserProfileModel> lista = parsed
          .map<UserProfileModel>((json) => UserProfileModel.fromJson(json))
          .toList();
      return lista;
    } else {
      throw "Error";
    }
  }
}

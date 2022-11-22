import 'dart:convert';
import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/models/user_model.dart';

class UserDataSource {
  Future<UserModel> getUserById(String uid) async {
    final response = await get(Uri.parse("$baseUrl/users/$uid"));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<UserModel> saveUser(UserModel userModel) async {
    final bodyData = jsonEncode(userModel.toJson());

    final responseValidated =
        await get(Uri.parse("$baseUrl/users/${userModel.id}"));
    if (responseValidated.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(responseValidated.body)["resource"]);
    }
    final response = await post(
        Uri.parse(
          "$baseUrl/users/register",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyData);

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<UserModel> updateUser(String uid) async {
    final response = await put(
        Uri.parse(
          "$baseUrl/users/$uid/assign/lessor",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/models/user_model.dart';

class UserDataSource {
  Future<UserModel> getUser() async {
    final response = await get(Uri.parse("http://127.0.0.1:5000/user"));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("fallo la llamada");
    }
  }

  Future<UserModel> saveUser(UserModel userModel) async {
    final bodyData = jsonEncode(userModel.toJson());

    final responseValidated = await get(Uri.parse(
        "https://meetyouroommate-backend.herokuapp.com/api/v1/users/${userModel.id}"));
    if (responseValidated.statusCode == 200) {
      print(responseValidated.body);
      return UserModel.fromJson(jsonDecode(responseValidated.body));
    }
    final response = await post(
        Uri.parse(
          "https://meetyouroommate-backend.herokuapp.com/api/v1/users/register",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyData);

    if (response.statusCode == 200) {
      print(response.body);
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception("fallo la llamada");
    }
  }

  Future<UserModel> updateUser(String uid) async {
    final response = await put(
        Uri.parse(
          "https://meetyouroommate-backend.herokuapp.com/api/v1/users/$uid/assign/lessor",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("fallo la llamada");
    }
  }
}

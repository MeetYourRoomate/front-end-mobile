import 'dart:convert';
import 'package:http/http.dart';
import 'package:meet_your_roommate/iam/infraestructure/models/user_model.dart';

class UserDataSource {
  Future<UserModel> getUser() async {
    final response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("fallo la llamada");
    }
  }
}

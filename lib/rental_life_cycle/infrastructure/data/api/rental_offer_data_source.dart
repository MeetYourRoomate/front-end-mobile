import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/common/config/path.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_offer_model.dart';

class RentalOfferDataSource {
  Future<List<RentalOfferModel>> getRentalOffers() async {
    final response = await get(
      Uri.parse("$baseUrl/rentaloffers/visibles"),
    );

    if (response.statusCode == 200) {
      final parsed =
          jsonDecode(response.body)["resource"].cast<Map<String, dynamic>>();

      //print(jsonDecode(response.body)["resource"][0]);
      List<RentalOfferModel> lista = parsed
          .map<RentalOfferModel>((json) => RentalOfferModel.fromJson(json))
          .toList();
      return lista;
    } else {
      throw "Error";
    }
  }

  Future<RentalOfferModel> saveRentalOffer(
      RentalOfferModel rentalOfferModel, String uid) async {
    final bodyData = jsonEncode(rentalOfferModel.toJson());

    final response = await post(
        Uri.parse(
          "$baseUrl/users/$uid/rental/offer",
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyData);
    if (response.statusCode == 200) {
      print(response.body);
      return RentalOfferModel.fromJson(jsonDecode(response.body)["resource"]);
    } else {
      throw Exception("fallo la llamada");
    }
  }
}

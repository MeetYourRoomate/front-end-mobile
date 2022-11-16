import 'dart:convert';

import 'package:http/http.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/models/rental_offer_model.dart';

class RentalOfferDataSource {
  Future<List<RentalOfferModel>> getRentalOffers() async {
    final response = await get(
      Uri.parse(
          "https://meetyouroommate-backend.herokuapp.com/api/v1/rentaloffers/visibles"),
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
}

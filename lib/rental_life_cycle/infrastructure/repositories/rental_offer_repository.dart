import 'package:flutter/cupertino.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/rental_offer_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_offer_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_offer_model.dart';

class RentalOfferRepository implements RentalOfferInterface {
  final RentalOfferDataSource _rentalOfferDataSource;

  RentalOfferRepository(this._rentalOfferDataSource);

  @override
  Future<RentalOffer> getRentalOfferById(String uid) {
    // TODO: implement getRentalOfferById
    throw UnimplementedError();
  }

  @override
  Future<List<RentalOffer>> getVisibleRentalOffer() async {
    return await _rentalOfferDataSource.getRentalOffers();
  }

  @override
  Future<RentalOffer> saveRentalOffer(
      RentalOffer rentalOffer, String uid) async {
    RentalOfferModel rentalOfferModel = RentalOfferModel(
      rentalOffer.id,
      rentalOffer.price,
      rentalOffer.currency,
      rentalOffer.conditions,
      rentalOffer.status,
      rentalOffer.visibility,
      rentalOffer.userProfile,
      rentalOffer.property,
    );
    return await _rentalOfferDataSource.saveRentalOffer(rentalOfferModel, uid);
  }
}

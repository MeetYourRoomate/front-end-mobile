import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/interface/rental_offer_interface.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_offer_data_source.dart';

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
}

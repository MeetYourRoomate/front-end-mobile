import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';

abstract class RentalOfferInterface {
  Future<List<RentalOffer>> getVisibleRentalOffer();
  Future<RentalOffer> getRentalOfferById(String uid);
  Future<RentalOffer> saveRentalOffer(RentalOffer rentalOffer, String uid);
}

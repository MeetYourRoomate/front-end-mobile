import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/repositories/rental_offer_repository.dart';

import '../domain/entity/rental_offer.dart';

class RentalOfferService {
  final RentalOfferRepository _rentalOfferRepository;

  RentalOfferService(this._rentalOfferRepository);

  Future<List<RentalOffer>> getVisibleRentalOffer() async {
    return await _rentalOfferRepository.getVisibleRentalOffer();
  }

  Future<RentalOffer> saveRentalOffer(
      RentalOffer rentalOffer, String uid) async {
    return await _rentalOfferRepository.saveRentalOffer(rentalOffer, uid);
  }
}

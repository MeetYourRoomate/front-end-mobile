import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/repositories/rental_offer_repository.dart';

import '../domain/entity/rental_offer.dart';

class RentalOfferService {
  final RentalOfferRepository _rentalOfferRepository = RentalOfferRepository();

  Future<List<RentalOffer>> getVisibleRentalOffer() async {
    return await _rentalOfferRepository.getVisibleRentalOffer();
  }
}

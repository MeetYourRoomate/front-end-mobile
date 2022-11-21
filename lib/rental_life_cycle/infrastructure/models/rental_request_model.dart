import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_offer_model.dart';

class RentalRequestModel extends RentalRequest {
  RentalRequestModel(
    super.id,
    super.status,
    super.message,
    super.studentProfile,
    super.rentalOffer,
    super.userId,
    super.rentalOfferId,
  );
  factory RentalRequestModel.fromJson(Map<String, dynamic> json) {
    UserProfileModel userProfileModel =
        UserProfileModel.fromJson(json["studentProfile"]);
    RentalOfferModel rentalOfferModel =
        RentalOfferModel.fromJson(json["rentalOffering"]);
    return RentalRequestModel(
      json["id"],
      json["status"],
      json["message"],
      userProfileModel,
      rentalOfferModel,
      null,
      null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "userId": userId,
      "rentalOfferId": rentalOfferId
    };
  }
}

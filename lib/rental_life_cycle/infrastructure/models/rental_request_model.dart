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
    UserProfileModel? userData() {
      if (json["studentProfile"] != null) {
        return UserProfileModel.fromJson(json["studentProfile"]);
      } else {
        return null;
      }
    }

    RentalOfferModel? rentalData() {
      if (json["rentalOffering"] != null) {
        return RentalOfferModel.fromJson(json["rentalOffering"]);
      } else {
        return null;
      }
    }

    return RentalRequestModel(
      json["id"],
      json["status"],
      json["message"],
      userData(),
      rentalData(),
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

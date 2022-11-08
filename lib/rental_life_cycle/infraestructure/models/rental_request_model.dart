import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';

class RentalRequestModel extends RentalRequest {
  RentalRequestModel(super.message, super.userId, super.rentalOfferId);

  factory RentalRequestModel.fromJson(Map<String, dynamic> json) {
    return RentalRequestModel(
        json["message"], json["userId"], json["rentalOfferId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "userId": userId,
      "rentalOfferId": rentalOfferId,
    };
  }
}

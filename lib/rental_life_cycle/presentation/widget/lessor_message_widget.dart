import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_request_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';

class LessorMessageWidget extends StatelessWidget {
  final RentalRequest rentalRequest;
  final bool isPending;
  final bool isAcepted;
  final bool isRejected;
  const LessorMessageWidget(
      {super.key,
      this.isPending = false,
      this.isAcepted = false,
      this.isRejected = false,
      required this.rentalRequest});

  @override
  Widget build(BuildContext context) {
    String imageDefault =
        rentalRequest.rentalOffer!.property!.assets!.isNotEmpty
            ? rentalRequest.rentalOffer!.property!.assets!.first.imageUrl!
            : "https://viviraqui.pe/upload/572vhy83gltyalwy.jpg";
    String profile = rentalRequest.studentProfile!.photoUrl!.isNotEmpty
        ? rentalRequest.studentProfile!.photoUrl!
        : "";
    RentalRequestService rentalRequestService = locator<RentalRequestService>();
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              CircleProfileAvatar(
                image: profile,
                radius: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rentalRequest.studentProfile!.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(rentalRequest.message!),
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageDefault))),
              )
            ],
          ),
          isPending
              ? Container(
                  padding: const EdgeInsets.only(left: 1),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final data = await rentalRequestService
                              .declineRentalRequest(rentalRequest.id!);
                          print("Rechazado ${data.message}");
                        },
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "REJECT",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          final data = await rentalRequestService
                              .acceptRentalRequest(rentalRequest.id!);
                        },
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: ColorsApp.primaryColor2,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "ACCEPT",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/iam/application/user_service.dart';
import 'package:meet_your_roommate_app/iam/domain/entity/user.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/data/api/user_data_source.dart';
import 'package:meet_your_roommate_app/iam/infraestructure/models/user_model.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/application/user_profile_service.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/data/api/user_profile_data_source.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_offer_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_request_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/data/api/rental_offer_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infrastructure/models/rental_offer_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/image_carousel.dart';
import 'package:meet_your_roommate_app/user_matching/application/duty_service.dart';
import 'package:meet_your_roommate_app/user_matching/application/roommate_request_service.dart';
import 'package:meet_your_roommate_app/user_matching/application/team_request_service.dart';
import 'package:meet_your_roommate_app/user_matching/application/team_service.dart';

class FatTest extends StatefulWidget {
  const FatTest({super.key});

  @override
  State<FatTest> createState() => _FatTestState();
}

class _FatTestState extends State<FatTest> {
  final UserProfileService userProfileService = locator<UserProfileService>();
  final RentalOfferService rentalOfferService = locator<RentalOfferService>();
  final PropertyService propertyService = locator<PropertyService>();
  final RentalRequestService rentalRequestService =
      locator<RentalRequestService>();
  final RoommateRequestService roommateRequestService =
      locator<RoommateRequestService>();

  final TeamService teamService = locator<TeamService>();
  final DutyService dutyService = locator<DutyService>();
  final TeamRequestService teamRequestService = locator<TeamRequestService>();

  final List imageData = [
    "https://www.bbva.com/wp-content/uploads/2021/04/casas-ecolo%CC%81gicas_apertura-hogar-sostenibilidad-certificado--1024x629.jpg",
    "https://images.adsttc.com/media/images/5d34/e507/284d/d109/5600/0240/large_jpg/_FI.jpg?1563747560",
    "https://images.homify.com/c_fill,f_auto,q_0,w_740/v1453460768/p/photo/image/1264226/02.jpg",
    "https://casasinhaus.com/wp-content/uploads/2021/10/casas-prefabricadas-valencia-fachada.jpg"
  ];
  final UserService userService = locator<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  // Property property = Property(null, "title 2", "description 2",
                  //     "tipe 2", "location 2", null, null);
                  // final data = await rentalOfferService.saveRentalOffer(
                  //   RentalOffer(
                  //     null,
                  //     100,
                  //     "USD",
                  //     "_conditions",
                  //     null,
                  //     null,
                  //     null,
                  //     property,
                  //   ),
                  //   "Zza7UXyX2uRvJ95OtVcFrqI37cx2",
                  // );
                  final data = await teamService.getAllTeams();
                  print(data.length);
                },
                child: Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Center(
                    child: Text("Probar"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

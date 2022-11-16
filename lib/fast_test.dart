import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/data/api/user_profile_data_source.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/data/api/rental_offer_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/models/rental_offer_model.dart';

class FatTest extends StatefulWidget {
  const FatTest({super.key});

  @override
  State<FatTest> createState() => _FatTestState();
}

class _FatTestState extends State<FatTest> {
  // final UserProfileDataSource _userProfileDataSource = UserProfileDataSource();
  final RentalOfferDataSource _rentalOfferDataSource = RentalOfferDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () async {
            List<RentalOfferModel> data =
                await _rentalOfferDataSource.getRentalOffers();
            print(data[0].property!.assets![0].imageUrl);
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
    );
  }
}

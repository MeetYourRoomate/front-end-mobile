import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/data/api/user_profile_data_source.dart';
import 'package:meet_your_roommate_app/profile/infraestructure/models/user_profile_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/data/api/rental_offer_data_source.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/infraestructure/models/rental_offer_model.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/image_carousel.dart';

class FatTest extends StatefulWidget {
  const FatTest({super.key});

  @override
  State<FatTest> createState() => _FatTestState();
}

class _FatTestState extends State<FatTest> {
  // final UserProfileDataSource _userProfileDataSource = UserProfileDataSource();
  final RentalOfferDataSource _rentalOfferDataSource = RentalOfferDataSource();

  final List imageData = [
    "https://www.bbva.com/wp-content/uploads/2021/04/casas-ecolo%CC%81gicas_apertura-hogar-sostenibilidad-certificado--1024x629.jpg",
    "https://images.adsttc.com/media/images/5d34/e507/284d/d109/5600/0240/large_jpg/_FI.jpg?1563747560",
    "https://images.homify.com/c_fill,f_auto,q_0,w_740/v1453460768/p/photo/image/1264226/02.jpg",
    "https://casasinhaus.com/wp-content/uploads/2021/10/casas-prefabricadas-valencia-fachada.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ImageCarouselWidget(
                  images: imageData,
                ),
                Positioned(
                  left: 10,
                  top: 50,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
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
          ],
        ),
      ),
    );
  }
}

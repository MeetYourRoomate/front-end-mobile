import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_asset_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/new_property/model_property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/new_property/property_description.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/new_property/property_direction.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/new_property/property_photos.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/new_property/property_services.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/new_property/review_property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:provider/provider.dart';

class TypePropertyPage extends StatefulWidget {
  const TypePropertyPage({super.key});

  @override
  State<TypePropertyPage> createState() => _TypePropertyPageState();
}

class _TypePropertyPageState extends State<TypePropertyPage> {
  final PropertyService propertyService = locator<PropertyService>();
  final PropertyAssetService propertyAssetService =
      locator<PropertyAssetService>();

  PageController pageController = PageController();
  int pageindex = 0;
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageindex = value;
                    if (pageindex == 5) {
                      isLast = true;
                    } else {
                      isLast = false;
                    }
                  });
                },
                children: const [
                  ModelPropertyScreen(),
                  PropertyDirection(),
                  PropertyServices(),
                  PropertyPhotos(),
                  PropertyDescription(),
                  ReviewProperty(),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (pageindex >= 1) {
                        pageController.animateToPage(--pageindex,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  InkWell(
                    onTap: () {
                      if (pageindex <= 4) {
                        pageController.animateToPage(++pageindex,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.bounceOut);
                        print(FirebaseAuth.instance.currentUser!.uid);
                      }
                    },
                    child: isLast
                        ? InkWell(
                            onTap: () async {
                              Property property = Property(
                                null,
                                propertyProvider.title,
                                propertyProvider.description,
                                null,
                                null,
                                null,
                                null,
                              );
                              await propertyService.saveProperty(property,
                                  FirebaseAuth.instance.currentUser!.uid);
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Center(
                                child: Text("Publicar"),
                              ),
                            ),
                          )
                        : const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

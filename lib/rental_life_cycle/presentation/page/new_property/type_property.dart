import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_asset_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_feature_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_offer_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
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
  final RentalOfferService rentalOfferService = locator<RentalOfferService>();
  final PropertyAssetService propertyAssetService =
      locator<PropertyAssetService>();
  final PropertyFeatureService propertyFeatureService =
      locator<PropertyFeatureService>();

  void back() {
    Navigator.pop(context);
  }

  PageController pageController = PageController();
  final storage = FirebaseStorage.instance.ref();
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
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  InkWell(
                    onTap: () {
                      if (pageindex <= 4) {
                        pageController.animateToPage(++pageindex,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: isLast
                        ? InkWell(
                            onTap: () async {
                              final navigator = Navigator.of(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsApp.primaryColor2,
                                    ),
                                  );
                                },
                              );
                              if (FirebaseAuth.instance.currentUser != null) {
                                Property property = Property(
                                  null,
                                  propertyProvider.title,
                                  propertyProvider.description,
                                  propertyProvider.propertyType,
                                  propertyProvider.location,
                                  null,
                                  null,
                                );
                                final datap =
                                    await rentalOfferService.saveRentalOffer(
                                        RentalOffer(
                                          null,
                                          propertyProvider.price,
                                          propertyProvider.currency,
                                          propertyProvider.conditions,
                                          null,
                                          null,
                                          null,
                                          property,
                                        ),
                                        FirebaseAuth.instance.currentUser!.uid);
                                if (propertyProvider.selectedImage.isNotEmpty &&
                                    datap.id != null) {
                                  for (int i = 0;
                                      i < propertyProvider.selectedImage.length;
                                      i++) {
                                    var imagePath =
                                        "properties/${datap.property!.id}/image_$i";
                                    final storaef = storage.child(imagePath);
                                    await storaef.putFile(
                                        propertyProvider.selectedImage[i]!);
                                    final imageUrl = await storage
                                        .child(imagePath)
                                        .getDownloadURL();
                                    propertyProvider.setAsset(
                                        PropertyAsset(imageUrl, null));
                                  }
                                  await propertyAssetService
                                      .saveListPropertyAssets(
                                          propertyProvider.assets,
                                          datap.property!.id!);
                                  await propertyFeatureService
                                      .saveListPropertyAssets(
                                          propertyProvider.listFeature,
                                          datap.property!.id!);
                                }
                              }
                              propertyProvider.clear();
                              navigator.pop();
                              back();
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                color: ColorsApp.primaryColor2,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Publicar",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
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

import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/iam/user_provider.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_offer_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:provider/provider.dart';

import '../../../rental_life_cycle/presentation/page/student/property_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final RentalOfferService _rentalOfferService = locator<RentalOfferService>();
  List<RentalOffer> listRentalOffer = [];
  Future fetchRentalOffer() async {
    final data = await _rentalOfferService.getVisibleRentalOffer();
    if (mounted) {
      setState(() {
        listRentalOffer = data;
      });
    }
  }

  @override
  void initState() {
    fetchRentalOffer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: userProvider.isLogged
          ? Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Favorites",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  listRentalOffer.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            scrollDirection: Axis.vertical,
                            itemCount: listRentalOffer.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PropertyPage(
                                                rentalOffer:
                                                    listRentalOffer[index],
                                              )));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 30.0),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 320.0,
                                            decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  listRentalOffer[index]
                                                      .property!
                                                      .assets!
                                                      .first
                                                      .imageUrl!,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10.0,
                                            right: 15.0,
                                            child: InkWell(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.favorite_sharp,
                                                color: Colors.red,
                                                size: 30.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Expanded(
                                                  child: Text(
                                                    "Alquilo Departamento para estudiantes",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 20,
                                                ),
                                                Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.star,
                                                      size: 20.0,
                                                      color: Colors.orange,
                                                    ),
                                                    Text(" 4.8")
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$.${listRentalOffer[index].price.toString()} / month",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                    "40 m2",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: ColorsApp.primaryColor2,
                          )),
                        )
                ],
              ),
            )
          : const Center(
              child: Text("Inicia Sesion para ver"),
            ),
    );
  }
}

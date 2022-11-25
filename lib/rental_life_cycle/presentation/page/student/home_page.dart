import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_offer_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/page/student/property_page.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({super.key});

  @override
  State<HomePageStudent> createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
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

  bool isFavorite = false;

  @override
  void initState() {
    fetchRentalOffer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return listRentalOffer.isNotEmpty
        ? Scaffold(
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  height: 150.0,
                  child: Center(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(3.0, 3.0),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "lib/shared/assets/icon/filtrar.png",
                            height: 40.0,
                            width: 40.0,
                          ),
                          const Text("Buscar"),
                          const Icon(
                            Icons.search,
                            size: 40.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                                        rentalOffer: listRentalOffer[index],
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
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          listRentalOffer[index]
                                                  .property!
                                                  .assets!
                                                  .isNotEmpty
                                              ? listRentalOffer[index]
                                                  .property!
                                                  .assets!
                                                  .first
                                                  .imageUrl!
                                              : "https://firebasestorage.googleapis.com/v0/b/meet-your-roommate-c7ed7.appspot.com/o/common%2FdefaultImage.jpeg?alt=media&token=d428210c-db58-4f65-b801-05605fea18d6",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10.0,
                                    right: 15.0,
                                    child: isFavorite
                                        ? const Icon(
                                            Icons.favorite_sharp,
                                            color: Colors.red,
                                            size: 30.0,
                                          )
                                        : const Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.black,
                                            size: 30.0,
                                          ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            listRentalOffer[index]
                                                .property!
                                                .tittle!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$.${listRentalOffer[index].price.toString()} / month",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          const Text(
                                            "40 m2",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
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
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(
            color: ColorsApp.primaryColor2,
          ));
  }
}

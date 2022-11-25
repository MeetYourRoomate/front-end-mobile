import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/hosted_profile_widget.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/rental_request_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_offer.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/rental_request.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/image_carousel.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_request.dart';
import 'package:provider/provider.dart';

class PropertyPage extends StatefulWidget {
  final RentalOffer rentalOffer;
  const PropertyPage({super.key, required this.rentalOffer});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

const snackBar = SnackBar(
  content: Text('Message sent!'),
);

class _PropertyPageState extends State<PropertyPage> {
  final RentalRequestService rentalRequestService =
      locator<RentalRequestService>();
  final defaultList = [
    "https://firebasestorage.googleapis.com/v0/b/meet-your-roommate-c7ed7.appspot.com/o/common%2FdefaultImage.jpeg?alt=media&token=d428210c-db58-4f65-b801-05605fea18d6"
  ];

  Icon validService(String service) {
    switch (service) {
      case "Wi-Fi":
        return const Icon(Icons.wifi);

      case "Tv":
        return const Icon(Icons.tv);

      case "Parking":
        return const Icon(Icons.minor_crash_outlined);

      case "Pool":
        return const Icon(Icons.pool);

      case "Store":
        return const Icon(Icons.store);

      case "Kitchen":
        return const Icon(Icons.kitchen);

      default:
        return const Icon(Icons.error);
    }
  }

  final List servicedefail = ["Vacio"];

  void back() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool find = true;
  void validProperty(List<RentalRequest> listRental, id) {}
  String message = "";
  @override
  Widget build(BuildContext context) {
    final data = widget.rentalOffer.property!.assets;
    final dataService = widget.rentalOffer.property!.features;

    final List images =
        data!.isNotEmpty ? data.map((e) => e.imageUrl).toList() : defaultList;
    final List service = dataService!.isNotEmpty
        ? dataService.map((e) => e.name).toList()
        : servicedefail;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ImageCarouselWidget(images: images),
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
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.rentalOffer.property!.tittle!,
                    style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              size: 25.0,
                              color: Colors.orange,
                            ),
                            Text(
                              " 4.8",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$.${widget.rentalOffer.price}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  HostedProfileWidget(
                    userProfile: widget.rentalOffer.userProfile!,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "DESCRIPTION",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.rentalOffer.property!.description!,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "SERVICES",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        service.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: service.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        validService(service[index]),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(service[index]),
                                      ],
                                    ),
                                  );
                                }))
                            : const Text("Not Haver Services"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "LOCATION",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.rentalOffer.property!.location!,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15.0),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2020/04/hipertextual-mas-facil-durante-cuarentena-google-maps-muestra-que-restaurantes-envian-domicilio-2020815281.jpg?fit=1500%2C1000&quality=50&strip=all&ssl=1",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 120.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 5.0),
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 20.0,
                                              backgroundImage: NetworkImage(
                                                  "https://fotografias.lasexta.com/clipping/cmsimages02/2022/05/03/6F9C82A4-0FA4-40F9-BE2F-87F8DBBC1224/elon-musk-met-gala_103.jpg?crop=1407,1055,x0,y18&width=1200&height=900&optimize=low&format=webply"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    "Elon Musk",
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Hace 1 semana",
                                                    style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0, top: 10.0),
                                          child: Text(
                                            "Arequipa altura del parque de las aguas Un lugar acogedor para vivir o trabajar en zona céntrica de Jesús María entre las",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: find
          ? InkWell(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("add a message"),
                    content: TextFormField(
                      maxLines: 3,
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                    ),
                    actions: [
                      InkWell(
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
                            await rentalRequestService.saveRentalRequest(
                                RentalRequest(
                                    null,
                                    null,
                                    message,
                                    null,
                                    null,
                                    FirebaseAuth.instance.currentUser!.uid,
                                    widget.rentalOffer.id));
                          }
                          navigator.pop();
                          back();
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            "Send",
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            "Cancel",
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                      ),
                    ],
                    actionsAlignment: MainAxisAlignment.center,
                    actionsPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Center(child: Text("Reserve")),
              ),
            )
          : Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: ColorsApp.primeryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Center(child: Text("Sent")),
            ),
    );
  }
}

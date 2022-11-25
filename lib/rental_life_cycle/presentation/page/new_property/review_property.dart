import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/profile/presentation/widget/circle_avatar_profile_widget.dart';
import 'package:meet_your_roommate_app/profile/user_profile_provider.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/close_created_property_widget.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:provider/provider.dart';

class ReviewProperty extends StatefulWidget {
  const ReviewProperty({super.key});

  @override
  State<ReviewProperty> createState() => _ReviewPropertyState();
}

class _ReviewPropertyState extends State<ReviewProperty> {
  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorsApp.primaryColor2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CloseCreatePropertyWidget(),
                        Text(
                          "Complete",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                    child: Text(
                      "Dale un vistazo a tu nuevo anuncio",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.file(
                      propertyProvider.selectedImage[0]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(propertyProvider.title),
                  Text("Price : ${propertyProvider.price.toString()}"),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                            offset: Offset(
                              4.0,
                              4.0,
                            )),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userProfileProvider.name),
                            Text("8 Propiedades"),
                            Text("5 Huéspedes"),
                          ],
                        ),
                        CircleProfileAvatar(image: userProfileProvider.photoUrl)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        propertyProvider.description,
                        style: const TextStyle(
                          fontSize: 14.0,
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
                          "Services",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: propertyProvider.listFeature.length,
                          itemBuilder: ((context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Text(propertyProvider
                                        .listFeature[index].name!)),
                                Text(propertyProvider.listFeature[index].type!),
                              ],
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Direccion",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          propertyProvider.location,
                          style: TextStyle(
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
                      borderRadius: BorderRadius.circular(15.0),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2020/04/hipertextual-mas-facil-durante-cuarentena-google-maps-muestra-que-restaurantes-envian-domicilio-2020815281.jpg?fit=1500%2C1000&quality=50&strip=all&ssl=1",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

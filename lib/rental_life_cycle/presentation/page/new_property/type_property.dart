import 'package:flutter/material.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/new_property/model_property.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/new_property/property_description.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/new_property/property_direction.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/new_property/property_photos.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/new_property/property_services.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/new_property/property_type.dart';
import 'package:meet_your_roommate/rental_life_cycle/presentation/page/new_property/review_property.dart';

class TypePropertyPage extends StatefulWidget {
  const TypePropertyPage({super.key});

  @override
  State<TypePropertyPage> createState() => _TypePropertyPageState();
}

class _TypePropertyPageState extends State<TypePropertyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: const [
                  ModelPropertyScreen(),
                  PropertyType(),
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
                children: const [
                  Icon(Icons.backspace_outlined),
                  Icon(Icons.skip_next),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/close_created_property_widget.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/property_service_widget.dart';

class PropertyServices extends StatefulWidget {
  const PropertyServices({super.key});

  @override
  State<PropertyServices> createState() => _PropertyServicesState();
}

class _PropertyServicesState extends State<PropertyServices> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    "Con que servicios cuenta su inmueble?",
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
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    PropertyServiceWidget(
                      name: "Wi-Fi",
                      icon: Icon(Icons.wifi),
                    ),
                    PropertyServiceWidget(
                      name: "Kitchen",
                      icon: Icon(Icons.kitchen),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    PropertyServiceWidget(
                      name: "Tv",
                      icon: Icon(Icons.tv),
                    ),
                    PropertyServiceWidget(
                      name: "Parking",
                      icon: Icon(Icons.minor_crash_outlined),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    PropertyServiceWidget(
                      name: "Pool",
                      icon: Icon(Icons.pool),
                    ),
                    PropertyServiceWidget(
                      name: "Store",
                      icon: Icon(Icons.store),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

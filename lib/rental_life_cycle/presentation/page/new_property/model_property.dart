import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/close_created_property_widget.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/type_property_widget.dart';

class ModelPropertyScreen extends StatefulWidget {
  const ModelPropertyScreen({super.key});

  @override
  State<ModelPropertyScreen> createState() => _ModelPropertyScreenState();
}

class _ModelPropertyScreenState extends State<ModelPropertyScreen> {
  bool isSelected = false;
  List type = [
    "House",
    "Condominio",
    "Building",
    "apartment",
  ];
  List text = [
    "a building in which people meet for a particular activity.",
    "a building or complex of buildings containing a number of individually owned apartments or houses",
    "a structure with a roof and walls, such as a house, school, store, or factory.",
    "a suite of rooms forming one residence, typically in a building containing a number of these",
  ];

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
                        "Type of Propertry",
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
                    "Que tipo de inmueble es la propiedad?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: type.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: TypePropertyWidget(
                    name: type[index], description: text[index]),
              );
            }),
          ))
        ],
      ),
    );
  }
}

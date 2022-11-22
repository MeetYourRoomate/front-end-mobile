import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:provider/provider.dart';

class TypePropertyWidget extends StatefulWidget {
  final String name;
  final String description;
  const TypePropertyWidget(
      {super.key, required this.name, required this.description});

  @override
  State<TypePropertyWidget> createState() => _TypePropertyWidgetState();
}

class _TypePropertyWidgetState extends State<TypePropertyWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    isSelected = propertyProvider.propertyType == widget.name ? true : false;
    return InkWell(
      onTap: () {
        propertyProvider.setPropertyType(widget.name);
      },
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: isSelected ? 2.0 : 1.0,
            color: isSelected ? Colors.black : Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

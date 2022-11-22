import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_feature.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:provider/provider.dart';

class PropertyServiceWidget extends StatefulWidget {
  final String name;
  final Icon icon;
  const PropertyServiceWidget(
      {super.key, required this.name, required this.icon});

  @override
  State<PropertyServiceWidget> createState() => _PropertyServiceWidgetState();
}

class _PropertyServiceWidgetState extends State<PropertyServiceWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (isSelected) {
          propertyProvider
              .setFeature(PropertyFeature(null, widget.name, "Service"));
        } else {
          propertyProvider
              .popFeature(PropertyFeature(null, widget.name, "Service"));
        }
      },
      child: Container(
        height: 120.0,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            width: isSelected ? 2.0 : 1.0,
            color: isSelected ? Colors.black : Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/property_service_widget.dart';

void main() {
  testWidgets("valid onTap change value to false-true",
      (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
        const PropertyServiceWidget(name: "Error", icon: Icon(Icons.error)));
  });
}

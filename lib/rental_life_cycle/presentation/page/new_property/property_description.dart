import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/close_created_property_widget.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:provider/provider.dart';

class PropertyDescription extends StatefulWidget {
  const PropertyDescription({super.key});

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription> {
  final _descriptionController = TextEditingController();
  final _titleController = TextEditingController();
  final _currencyController = TextEditingController();
  final _priceController = TextEditingController();

  final PropertyService propertyService = locator<PropertyService>();

  @override
  void dispose() {
    _descriptionController.dispose();
    _priceController.dispose();
    _titleController.dispose();
    _currencyController.dispose();
    super.dispose();
  }

  final listCurrency = ["EUR", "JPY", "CAD", "GBP"];
  String currency = "USD";

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
                            "Complete description",
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30.0),
                      child: Text(
                        "Add title,description and price",
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
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text("Titulo"),
                        Center(
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            child: TextFormField(
                              maxLength: 80,
                              onChanged: (value) {
                                propertyProvider.setTitle(value);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ingrese Titulo aquí...",
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        const Text("Descripcion"),
                        Center(
                          child: Container(
                            height: 130.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            child: TextFormField(
                              maxLength: 160,
                              onChanged: (value) {
                                propertyProvider.setDescription(value);
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Ingrese descripcion aquí...",
                                  filled: true,
                                  fillColor: Colors.white),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                              validator: ((value) {
                                if (value!.isNotEmpty) {
                                  return "Texto Vacio";
                                } else {
                                  return null;
                                }
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text("Precio"),
                            Center(
                              child: Container(
                                height: 70.0,
                                width: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    propertyProvider
                                        .setPrice(double.parse(value));
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "300",
                                      filled: true,
                                      fillColor: Colors.white),
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                  validator: ((value) {
                                    if (value!.isNotEmpty) {
                                      return "Texto Vacio";
                                    } else {
                                      return null;
                                    }
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        DropdownButton(
                          dropdownColor: ColorsApp.primeryColor,
                          focusColor: ColorsApp.primaryColor2,
                          borderRadius: BorderRadius.circular(10),
                          items: listCurrency.map((String a) {
                            return DropdownMenuItem(
                              value: a,
                              child: Text(a),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              currency = value!;
                            });
                            propertyProvider.setCurrency(currency);
                          },
                          hint: Text(currency),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

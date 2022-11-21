import 'package:flutter/material.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:provider/provider.dart';

class PropertyDescription extends StatefulWidget {
  const PropertyDescription({super.key});

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription> {
  final _descriptionController = TextEditingController();

  final PropertyService propertyService = locator<PropertyService>();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

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
                color: Colors.orange.shade400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.close),
                          Text("Complete"),
                          Icon(Icons.help),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30.0),
                      child: Text(
                        "Ponle titulo y describe tu inmueble",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text("Titulo"),
                        Center(
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
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
                    Column(
                      children: [
                        const Text("Descripcion"),
                        Center(
                          child: Container(
                            height: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
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
                    Column(
                      children: [
                        const Text("Precio"),
                        Center(
                          child: Container(
                            height: 70.0,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                propertyProvider.setPrice(int.parse(value));
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

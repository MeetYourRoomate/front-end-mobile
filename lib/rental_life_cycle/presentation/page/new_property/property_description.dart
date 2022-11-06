import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_roommate/rental_life_cycle/application/dto/property_service.dart';
import 'package:meet_your_roommate/rental_life_cycle/domain/entity/property.dart';

class PropertyDescription extends StatefulWidget {
  const PropertyDescription({super.key});

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription> {
  final _descriptionController = TextEditingController();

  late PropertyService propertyService;

  @override
  void initState() {
    propertyService = PropertyService();
    super.initState();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
            Column(
              children: [
                Column(
                  children: [
                    const Text("Titulo"),
                    Center(
                      child: Container(
                        height: 120.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 2,
                            color: Colors.blue,
                          ),
                        ),
                        child: TextFormField(
                          controller: _descriptionController,
                          maxLength: 80,
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
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () async {
                String? uid = FirebaseAuth.instance.currentUser?.uid;
                if (_descriptionController.text.isNotEmpty && uid != null) {
                  Property property =
                      Property(_descriptionController.text, "Prueba Title");
                  await propertyService.saveProperty(property, uid);
                  Navigator.pop(context);
                } else {
                  print("Texto vacio");
                }
              },
              child: Container(
                height: 70.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: const Center(
                    child: Text(
                  "Crear",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

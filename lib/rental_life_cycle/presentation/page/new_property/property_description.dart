import 'package:flutter/material.dart';

class PropertyDescription extends StatefulWidget {
  const PropertyDescription({super.key});

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 2,
                            color: Colors.blue,
                          ),
                        ),
                        child: const TextField(
                          maxLength: 160,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ingrese Titulo aquí...",
                              filled: true,
                              fillColor: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 10,
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
            Column(
              children: [
                Column(
                  children: [
                    const Text("Descripcion"),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        child: const TextField(
                          maxLength: 160,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ingrese Descripcion aquí...",
                              filled: true,
                              fillColor: Colors.white),
                          textAlign: TextAlign.start,
                          maxLines: 10,
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
            Column(
              children: [
                Column(
                  children: [
                    const Text("Precio"),
                    Center(
                      child: Container(
                        height: 70.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            border: InputBorder.none,
                            hintText: "s. 70.00",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

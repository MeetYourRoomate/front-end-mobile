import 'package:flutter/material.dart';

class PropertyPhotos extends StatefulWidget {
  const PropertyPhotos({super.key});

  @override
  State<PropertyPhotos> createState() => _PropertyPhotosState();
}

class _PropertyPhotosState extends State<PropertyPhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    "Aguega Algunas Fotos de su inmueble",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.black,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.photo_album_outlined,
                      size: 50.0,
                    ),
                    Text(
                      "Agrega Por lo menos Cinco fotos",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text("Sube foto desde su telephono"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

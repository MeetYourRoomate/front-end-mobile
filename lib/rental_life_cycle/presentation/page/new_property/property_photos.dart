import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meet_your_roommate_app/common/utils/colors.dart';
import 'package:meet_your_roommate_app/injectable.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/application/property_asset_service.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/presentation/widget/close_created_property_widget.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/property_provider.dart';
import 'package:provider/provider.dart';

class PropertyPhotos extends StatefulWidget {
  const PropertyPhotos({super.key});

  @override
  State<PropertyPhotos> createState() => _PropertyPhotosState();
}

class _PropertyPhotosState extends State<PropertyPhotos> {
  final ImagePicker _imagePicker = ImagePicker();

  final storage = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
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
                        "Selected some Photos",
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
                    "Add some images for your property",
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
          propertyProvider.countImages
              ? Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: propertyProvider.selectedImage.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.file(
                                propertyProvider.selectedImage[index]!));
                      })),
                )
              : Container(
                  height: 250.0,
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () async {
                      var imagen = await _imagePicker.pickMultiImage();
                      await propertyProvider.setSelectImages(imagen);
                    },
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
                  ),
                )
        ],
      ),
    );
  }
}

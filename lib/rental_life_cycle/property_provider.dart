import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_feature.dart';

class PropertyProvider with ChangeNotifier {
  String _tittle = "none";
  String _description = "none";
  String _propertyType = "none";
  String _location = "none";
  String _currency = "USD";
  String _conditions = "none";
  double _price = 0;
  List<File?> _selectedImage = [];
  List<PropertyAsset> _assets = [];
  List<PropertyFeature> _listFeature = [];

  String get title => _tittle;
  String get description => _description;
  String get propertyType => _propertyType;
  String get location => _location;
  String get currency => _currency;
  String get conditions => _conditions;
  double get price => _price;
  List<File?> get selectedImage => _selectedImage;
  List<PropertyFeature> get listFeature => _listFeature;
  List<PropertyAsset> get assets => _assets;

  bool get countImages {
    if (_selectedImage.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> setSelectImages(List<XFile> imagen) async {
    if (imagen.isNotEmpty) {
      for (int i = 0; i < imagen.length; i++) {
        _selectedImage.add(File(imagen[i].path));
      }
    } else {
      _selectedImage = selectedImage;
    }
    notifyListeners();
  }

  Future<void> setFeature(PropertyFeature propertyFeature) async {
    _listFeature.add(propertyFeature);
    notifyListeners();
  }

  Future<void> popFeature(PropertyFeature propertyFeature) async {
    _listFeature.removeWhere((element) => element.name == propertyFeature.name);
    notifyListeners();
  }

  Future<void> setAsset(PropertyAsset propertyAsset) async {
    _assets.add(propertyAsset);
    notifyListeners();
  }

  Future<void> setTitle(String title) async {
    _tittle = title;
    notifyListeners();
  }

  Future<void> setDescription(String description) async {
    _description = description;
    notifyListeners();
  }

  Future<void> setLocation(String location) async {
    _location = location;
    notifyListeners();
  }

  Future<void> setPropertyType(String propertyType) async {
    _propertyType = propertyType;
    notifyListeners();
  }

  Future<void> setCurrency(String currency) async {
    _currency = currency;
    notifyListeners();
  }

  Future<void> setCondition(String conditions) async {
    _conditions = conditions;
    notifyListeners();
  }

  Future<void> setPrice(double price) async {
    _price = price;
    notifyListeners();
  }

  Future<void> clear() async {
    _tittle = "none";
    _description = "none";
    _propertyType = "none";
    _location = "none";
    _currency = "USD";
    _conditions = "none";
    _price = 0;
    _selectedImage = [];
    _assets = [];
    _listFeature = [];
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PropertyProvider with ChangeNotifier {
  String _tittle = "none";
  String _description = "none";
  String _currency = "USD";
  String _conditions = "none";
  int _price = 0;
  List<File?> _selectedImage = [];
  List imagesPaths = [];

  String get title => _tittle;
  String get description => _description;
  String get currency => _currency;
  String get conditions => _conditions;
  int get price => _price;
  List<File?> get selectedImage => _selectedImage;

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

  Future<void> setTitle(String title) async {
    _tittle = title;
    notifyListeners();
  }

  Future<void> setDescription(String description) async {
    _description = description;
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

  Future<void> setPrice(int price) async {
    _price = price;
    notifyListeners();
  }
}

import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';
import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_feature.dart';

class Property {
  final int? _id;
  final String? _tittle;
  final String? _description;
  final String? _propertyType;
  final String? _location;
  final List<PropertyAsset>? _assets;
  final List<PropertyFeature>? _features;

  Property(
    this._id,
    this._tittle,
    this._description,
    this._propertyType,
    this._location,
    this._assets,
    this._features,
  );

  int? get id => _id;
  List<PropertyAsset>? get assets => _assets;
  List<PropertyFeature>? get features => _features;
  String? get propertyType => _propertyType;
  String? get location => _location;

  String? get description => _description;
  String? get tittle => _tittle;
}

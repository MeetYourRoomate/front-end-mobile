import 'package:meet_your_roommate_app/rental_life_cycle/domain/entity/property_asset.dart';

class Property {
  final int? _id;
  final String? _tittle;
  final String? _description;
  final List<PropertyAsset>? _assets;

  Property(
    this._description,
    this._tittle,
    this._assets,
    this._id,
  );

  int? get id => _id;
  List<PropertyAsset>? get assets => _assets;

  String? get description => _description;
  String? get tittle => _tittle;
}

class PropertyAsset {
  final int? _id;
  final String? _imageUrl;

  PropertyAsset(this._imageUrl, this._id);

  int? get id => _id;
  String? get imageUrl => _imageUrl;
}

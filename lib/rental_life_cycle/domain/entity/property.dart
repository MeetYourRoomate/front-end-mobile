class Property {
  int? _id;
  String? _title;

  set property(Property property) {
    _id = property._id;
    _title = property._title;
  }

  int? get id => _id;
  String? get title => _title;
}

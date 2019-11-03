class Product {
  String id;
  String name;
  bool isSelected;

  Product({this.id, this.name, this.isSelected});

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        isSelected = snapshot['is_selected'] ?? '';

  toJson() {
    return {
      "name": name,
      "is_selected": isSelected,
    };
  }
}

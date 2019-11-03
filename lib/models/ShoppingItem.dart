class ShoppingItem {
  String id;
  String name;
  bool isChecked;

  ShoppingItem(this.name, this.isChecked);

  ShoppingItem.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        isChecked = snapshot['is_checked'] ?? false;

  toJson() {
    return {
      "name": name,
      "is_selected": isChecked,
    };
  }
}

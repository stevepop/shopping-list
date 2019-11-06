class ShoppingItem {
  String id;
  String name;
  String productId;
  bool isChecked;

  ShoppingItem(this.name, this.productId, this.isChecked);

  ShoppingItem.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        productId = snapshot['product_id'] ?? '',
        isChecked = snapshot['is_checked'] ?? false;

  toJson() {
    return {
      "name": name,
      "product_id": productId,
      "is_checked": isChecked,
    };
  }
}

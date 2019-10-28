class Product {
  String name;
  bool isChecked;

  Product(this.name, this.isChecked);

  static get all {
    return [
      Product('Eggs', false),
      Product('Milk', false),
      Product('Bread', false),
    ];
  }
}

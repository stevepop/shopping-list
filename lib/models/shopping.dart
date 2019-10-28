class Shopping {
  String name;
  bool isChecked;

  Shopping(this.name, this.isChecked);

  static get all {
    return [
      Shopping('Eggs', false),
      Shopping('Milk', false),
      Shopping('Bread', false),
    ];
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  bool isSelected;

  Product({this.id, this.name, this.isSelected});

  factory Product.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Product(
        id: doc.documentID,
        name: data['name'] ?? '',
        isSelected: data['isSelected'] ?? '');
  }

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

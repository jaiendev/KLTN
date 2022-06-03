import 'dart:convert';

import 'package:app_kltn_trunghoan/models/product_model.dart';

class PurchasingModel {
  final String id;
  final ProductModel items;
  final String name;
  final String shippingAddress;
  final double price;
  final int qty;
  PurchasingModel({
    required this.id,
    required this.items,
    required this.name,
    required this.shippingAddress,
    required this.price,
    required this.qty,
  });

  PurchasingModel copyWith({
    String? id,
    ProductModel? items,
    String? name,
    String? shippingAddress,
    double? price,
    int? qty,
  }) {
    return PurchasingModel(
      id: id ?? this.id,
      items: items ?? this.items,
      name: name ?? this.name,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      price: price ?? this.price,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'items': items.toMap(),
      'name': name,
      'shippingAddress': shippingAddress,
      'price': price,
      'qty': qty,
    };
  }

  factory PurchasingModel.fromMap(Map<String, dynamic> map) {
    return PurchasingModel(
      id: map['_id'] ?? '',
      items: ProductModel.fromMap(map['items']),
      name: map['name'] ?? '',
      shippingAddress: map['shippingAddress'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      qty: map['qty']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchasingModel.fromJson(String source) =>
      PurchasingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PurchasingModel(id: $id, items: $items, name: $name, shippingAddress: $shippingAddress, price: $price, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurchasingModel &&
        other.id == id &&
        other.items == items &&
        other.name == name &&
        other.shippingAddress == shippingAddress &&
        other.price == price &&
        other.qty == qty;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        items.hashCode ^
        name.hashCode ^
        shippingAddress.hashCode ^
        price.hashCode ^
        qty.hashCode;
  }
}

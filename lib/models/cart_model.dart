import 'dart:convert';

import 'package:app_kltn_trunghoan/helpers/extentions/strings_extentions.dart';

class CartModel {
  final String id;
  final String productId;
  final String productName;
  final String productPicture;
  int qty;
  int price;
  bool? isWorking;
  CartModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPicture,
    required this.qty,
    required this.price,
    this.isWorking,
  });

  CartModel copyWith({
    String? id,
    String? productId,
    String? productName,
    String? productPicture,
    int? qty,
    int? price,
    bool? isWorking,
  }) {
    return CartModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productPicture: productPicture ?? this.productPicture,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      isWorking: isWorking ?? this.isWorking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productPicture': productPicture,
      'qty': qty,
      'price': price,
      'isWorking': isWorking,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['_id'] ?? '',
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      productPicture: map['productPicture'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      isWorking: map['isWorking'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartModel(id: $id, productId: $productId, productName: $productName, productPicture: $productPicture, qty: $qty, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.id == id &&
        other.productId == productId &&
        other.productName == productName &&
        other.productPicture == productPicture &&
        other.qty == qty &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productId.hashCode ^
        productName.hashCode ^
        productPicture.hashCode ^
        qty.hashCode ^
        price.hashCode;
  }

  String get costString {
    return price.toStringAsFixed(0).formatMoney() + 'đ';
  }
}

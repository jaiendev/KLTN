import 'dart:convert';

import 'package:app_kltn_trunghoan/helpers/extentions/strings_extentions.dart';
import 'package:flutter/foundation.dart';

import 'package:app_kltn_trunghoan/models/cart_model.dart';

class PurchaseModel {
  final String id;
  final String name;
  final String shippingAddress;
  final int status;
  final int totalPrice;
  final List<CartModel> items;
  final DateTime date;
  PurchaseModel({
    required this.id,
    required this.name,
    required this.shippingAddress,
    required this.status,
    required this.totalPrice,
    required this.items,
    required this.date,
  });

  PurchaseModel copyWith({
    String? id,
    String? name,
    String? shippingAddress,
    int? status,
    int? totalPrice,
    List<CartModel>? items,
    DateTime? date,
  }) {
    return PurchaseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      items: items ?? this.items,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shippingAddress': shippingAddress,
      'status': status,
      'totalPrice': totalPrice,
      'items': items.map((x) => x.toMap()).toList(),
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory PurchaseModel.fromMap(Map<String, dynamic> map) {
    return PurchaseModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      shippingAddress: map['shippingAddress'] ?? '',
      status: map['status']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      items: (map['items'] as List).map((e) => CartModel.fromMap(e)).toList(),
      date: DateTime.parse(map['date']).toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseModel.fromJson(String source) =>
      PurchaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PurchaseModel(id: $id, name: $name, shippingAddress: $shippingAddress, status: $status, totalPrice: $totalPrice, items: $items, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurchaseModel &&
        other.id == id &&
        other.name == name &&
        other.shippingAddress == shippingAddress &&
        other.status == status &&
        other.totalPrice == totalPrice &&
        listEquals(other.items, items) &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        shippingAddress.hashCode ^
        status.hashCode ^
        totalPrice.hashCode ^
        items.hashCode ^
        date.hashCode;
  }

  String get costString {
    return totalPrice.toStringAsFixed(0).formatMoney() + 'đ';
  }
}

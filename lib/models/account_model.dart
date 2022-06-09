import 'dart:convert';

import 'package:app_kltn_trunghoan/models/card_model.dart';
import 'package:flutter/foundation.dart';

import 'package:app_kltn_trunghoan/models/puchasing_model.dart';

class AccountModel {
  final String id;
  String name;
  final String email;
  final String photo;
  final String address;
  final String phone;
  final String gender;
  final String role;
  final List<PurchasingModel>? purchasingHistory;
  final List<CartModel>? cart;
  final bool verified;
  AccountModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.address,
    required this.phone,
    required this.gender,
    required this.role,
    this.purchasingHistory,
    this.cart,
    required this.verified,
  });

  AccountModel copyWith({
    String? id,
    String? name,
    String? email,
    String? photo,
    String? address,
    String? phone,
    String? gender,
    String? role,
    List<PurchasingModel>? purchasingHistory,
    List<CartModel>? cart,
    bool? verified,
  }) {
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      purchasingHistory: purchasingHistory ?? this.purchasingHistory,
      cart: cart ?? this.cart,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'photo': photo,
      'address': address,
      'phone': phone,
      'gender': gender,
      'role': role,
      'purchasingHistory': purchasingHistory?.map((x) => x.toMap()).toList(),
      'cart': cart?.map((x) => x.toMap()).toList(),
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photo: map['photo'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      role: map['role'] ?? '',
      verified: map['verified'] ?? false,
      purchasingHistory: map['purchasingHistory'] == null
          ? []
          : (map['purchasingHistory'] as List<dynamic>)
              .map((offer) => PurchasingModel.fromMap(offer))
              .toList(),
      // cart: map['cart']['items'] != null
      //     ? List<CartModel>.from((map['cart']['items'])
      //         .map((product) => CartModel.fromMap(product)))
      //     : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, email: $email, photo: $photo, address: $address, phone: $phone, gender: $gender, role: $role, purchasingHistory: $purchasingHistory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.photo == photo &&
        other.address == address &&
        other.phone == phone &&
        other.gender == gender &&
        other.role == role &&
        listEquals(other.purchasingHistory, purchasingHistory);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        photo.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        gender.hashCode ^
        role.hashCode ^
        purchasingHistory.hashCode;
  }
}

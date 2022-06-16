import 'dart:convert';

class OrderDescriptionModel {
  final String userId;
  final String? name;
  final String shippingAddress;
  final int? status;
  final int totalPrice;
  OrderDescriptionModel({
    required this.userId,
    this.name,
    required this.shippingAddress,
    this.status,
    required this.totalPrice,
  });

  OrderDescriptionModel copyWith({
    String? userId,
    String? name,
    String? shippingAddress,
    int? status,
    int? totalPrice,
  }) {
    return OrderDescriptionModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': DateTime.now().microsecondsSinceEpoch.toString(),
      'shippingAddress': shippingAddress,
      'status': 0,
      'totalPrice': totalPrice,
    };
  }

  factory OrderDescriptionModel.fromMap(Map<String, dynamic> map) {
    return OrderDescriptionModel(
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      shippingAddress: map['shippingAddress'] ?? '',
      status: map['status']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDescriptionModel.fromJson(String source) =>
      OrderDescriptionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderDescriptionModel(userId: $userId, name: $name, shippingAddress: $shippingAddress, status: $status, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderDescriptionModel &&
        other.userId == userId &&
        other.name == name &&
        other.shippingAddress == shippingAddress &&
        other.status == status &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        shippingAddress.hashCode ^
        status.hashCode ^
        totalPrice.hashCode;
  }
}

import 'dart:convert';

import 'package:app_kltn_trunghoan/helpers/extentions/strings_extentions.dart';

class ProductModel {
  final String id;
  final String name;
  final String slug;
  final double price;
  final String? description;
  final String? productPicture;
  final int? ratingsQuantity;
  final double ratingAverage;
  final String? category;
  final String? categoryName;
  DateTime? createBy;
  DateTime? createdAt;
  DateTime? updateAt;
  ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    this.description,
    this.productPicture,
    this.ratingsQuantity,
    this.ratingAverage = 0.0,
    this.category,
    this.createBy,
    this.createdAt,
    this.updateAt,
    this.categoryName,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? slug,
    double? price,
    String? description,
    String? productPicture,
    int? ratingsQuantity,
    double? ratingAverage,
    String? categoy,
    DateTime? createBy,
    DateTime? createdAt,
    DateTime? updateAt,
    String? categoryName,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      description: description ?? this.description,
      productPicture: productPicture ?? this.productPicture,
      ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
      ratingAverage: ratingAverage ?? this.ratingAverage,
      category: categoy ?? this.category,
      createBy: createBy ?? this.createBy,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'price': price,
      'description': description,
      'productPicture': productPicture,
      'ratingsQuantity': ratingsQuantity,
      'ratuingAverage': ratingAverage,
      'categoy': category,
      'createBy': createBy?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
      'categoryName': categoryName,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'],
      productPicture: map['productPicture'],
      ratingsQuantity: map['ratingsQuantity']?.toInt(),
      ratingAverage: map['ratingsAverage']?.toDouble(),
      category: map['category']?['_id'] ?? '',
      createBy: map['createBy'] != null
          ? DateTime.parse(map['createBy']).toLocal()
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt']).toLocal()
          : null,
      updateAt: map['updateAt'] != null
          ? DateTime.parse(map['updateAt']).toLocal()
          : null,
      categoryName: map['category']?['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, slug: $slug, price: $price, description: $description, productPicture: $productPicture, ratingsQuantity: $ratingsQuantity, ratingAverage: $ratingAverage, categoy: $category, createBy: $createBy, createdAt: $createdAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.price == price &&
        other.description == description &&
        other.productPicture == productPicture &&
        other.ratingsQuantity == ratingsQuantity &&
        other.ratingAverage == ratingAverage &&
        other.category == category &&
        other.createBy == createBy &&
        other.createdAt == createdAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        price.hashCode ^
        description.hashCode ^
        productPicture.hashCode ^
        ratingsQuantity.hashCode ^
        ratingAverage.hashCode ^
        category.hashCode ^
        createBy.hashCode ^
        createdAt.hashCode ^
        updateAt.hashCode;
  }

  String get costString {
    return price.toStringAsFixed(0).formatMoney() + 'đ';
  }
}

import 'dart:convert';

// import 'package:app_kltn_trunghoan/constants/constants.dart';

// class ProductModel {
//   final String title;
//   final String type;
//   final double cost;
//   final String urlToImage;
//   final String description;
//   ProductModel({
//     required this.title,
//     required this.type,
//     this.cost = 250,
//     this.urlToImage = urlImageProduct,
//     this.description = descriptionProductFake,
//   });
// }

// List<ProductModel> productList = [
//   ProductModel(title: 'Màn hình Dell S2421H 23.8 inch 70X9V1', type: 'Screen'),
//   ProductModel(
//     title: 'Màn hình Dell S2421H 23.8 inch 70X9V1',
//     type: 'Screen',
//     urlToImage: urlImageProduct2,
//   ),
//   ProductModel(title: 'Màn hình Dell S2421H 23.8 inch 70X9V1', type: 'Screen'),
//   ProductModel(title: 'Màn hình Dell S2421H 23.8 inch 70X9V1', type: 'Screen'),
//   ProductModel(title: 'Màn hình Dell S2421H 23.8 inch 70X9V1', type: 'Screen'),
// ];

// const String descriptionProductFake =
//     'Dell S2421H 23.8 inch 70X9V1 has an elegant, modern design with a display that sinks behind the screen for a unique beauty. The shape has a full HD parse (1920x1080) allowing you to enjoy clear and detailed images.';

class ProductModel {
  final String id;
  final String name;
  final String slug;
  final double price;
  final String? description;
  final String? productPicture;
  final int? ratingsQuantity;
  final int? ratuingAverage;
  final String? categoy;
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
    this.ratuingAverage,
    this.categoy,
    this.createBy,
    this.createdAt,
    this.updateAt,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? slug,
    double? price,
    String? description,
    String? productPicture,
    int? ratingsQuantity,
    int? ratuingAverage,
    String? categoy,
    DateTime? createBy,
    DateTime? createdAt,
    DateTime? updateAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      description: description ?? this.description,
      productPicture: productPicture ?? this.productPicture,
      ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
      ratuingAverage: ratuingAverage ?? this.ratuingAverage,
      categoy: categoy ?? this.categoy,
      createBy: createBy ?? this.createBy,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
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
      'ratuingAverage': ratuingAverage,
      'categoy': categoy,
      'createBy': createBy?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
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
      ratuingAverage: map['ratuingAverage']?.toInt(),
      categoy: map['categoy'],
      createBy: map['createBy'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createBy'])
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      updateAt: map['updateAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updateAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, slug: $slug, price: $price, description: $description, productPicture: $productPicture, ratingsQuantity: $ratingsQuantity, ratuingAverage: $ratuingAverage, categoy: $categoy, createBy: $createBy, createdAt: $createdAt, updateAt: $updateAt)';
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
        other.ratuingAverage == ratuingAverage &&
        other.categoy == categoy &&
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
        ratuingAverage.hashCode ^
        categoy.hashCode ^
        createBy.hashCode ^
        createdAt.hashCode ^
        updateAt.hashCode;
  }
}

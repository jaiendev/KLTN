import 'dart:convert';

import 'package:flutter/foundation.dart';

class CategoryHomeModel {
  final String id;
  final String name;
  final String slug;
  final String imageCategory;
  final List<CategoryHomeModel>? children;
  bool isCheck;
  CategoryHomeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageCategory,
    this.children,
    this.isCheck = false,
  });

  CategoryHomeModel copyWith({
    String? id,
    String? name,
    String? slug,
    String? imageCategory,
    List<CategoryHomeModel>? children,
  }) {
    return CategoryHomeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      imageCategory: imageCategory ?? this.imageCategory,
      children: children ?? this.children,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'imageCategory': imageCategory,
      'children': children?.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryHomeModel.fromMap(Map<String, dynamic> map) {
    return CategoryHomeModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      imageCategory: map['imageCategory'] ?? '',
      children: map['children'] != null
          ? (map['children'] as List)
              .map((e) => CategoryHomeModel.fromMap(e))
              .toList()
          : null,
      isCheck: false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryHomeModel.fromJson(String source) =>
      CategoryHomeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryHomeModel(id: $id, name: $name, slug: $slug, imageCategory: $imageCategory, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryHomeModel &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.imageCategory == imageCategory &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        imageCategory.hashCode ^
        children.hashCode;
  }
}

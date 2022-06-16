import 'dart:convert';

import 'package:flutter/foundation.dart';

class RatingModel {
  final String id;
  final String review;
  final String user;
  final String name;
  final String? photo;
  final DateTime? createdAt;
  final int? rating;
  final List<String> photoReviews;
  RatingModel({
    required this.id,
    required this.review,
    required this.user,
    required this.name,
    this.photo,
    this.createdAt,
    this.rating,
    required this.photoReviews,
  });

  RatingModel copyWith({
    String? id,
    String? review,
    String? user,
    String? name,
    String? photo,
    DateTime? createdAt,
    int? rating,
    List<String>? photoReviews,
  }) {
    return RatingModel(
      id: id ?? this.id,
      review: review ?? this.review,
      user: user ?? this.user,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      createdAt: createdAt ?? this.createdAt,
      rating: rating ?? this.rating,
      photoReviews: photoReviews ?? this.photoReviews,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'review': review,
      'user': user,
      'name': name,
      'photo': photo,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'rating': rating,
      'photoReviews': photoReviews,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      id: map['id'] ?? '',
      review: map['review'] ?? '',
      user: map['user'] ?? '',
      name: map['name'] ?? '',
      photo: map['photo'],
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt']).toLocal()
          : null,
      rating: map['rating']?.toInt(),
      photoReviews: List<String>.from(map['photoReviews']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) =>
      RatingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RatingModel(id: $id, review: $review, user: $user, name: $name, photo: $photo, createdAt: $createdAt, rating: $rating, photoReviews: $photoReviews)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RatingModel &&
        other.id == id &&
        other.review == review &&
        other.user == user &&
        other.name == name &&
        other.photo == photo &&
        other.createdAt == createdAt &&
        other.rating == rating &&
        listEquals(other.photoReviews, photoReviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        review.hashCode ^
        user.hashCode ^
        name.hashCode ^
        photo.hashCode ^
        createdAt.hashCode ^
        rating.hashCode ^
        photoReviews.hashCode;
  }
}

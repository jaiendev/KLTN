import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CategoryModel {
  final IconData icon;
  final String title;
  bool isCheck;
  final String id;

  CategoryModel({
    required this.icon,
    required this.title,
    this.isCheck = false,
    required this.id,
  });
}

final List<CategoryModel> listCategories = [
  CategoryModel(
    icon: PhosphorIcons.desktop_light,
    title: 'Màn hình',
    id: '61a8a5c663bfc4c3df6b3c3c',
  ),
  CategoryModel(
    icon: PhosphorIcons.mouse_light,
    title: 'Chuột',
    id: '61b313fc9fe7ef8f774e6c46',
  ),
  CategoryModel(
    icon: PhosphorIcons.headphones_light,
    title: 'Tai nghe',
    id: '61b313fc9fe7ef8f774e6c46',
  ),
  CategoryModel(
    icon: PhosphorIcons.keyboard_light,
    title: 'Bàn phím cơ',
    id: '61a8a68a63bfc4c3df6b3c55',
  ),
  CategoryModel(
    icon: PhosphorIcons.laptop_light,
    title: 'Laptop',
    id: '61b312e39fe7ef8f774e6c37',
  ),
  CategoryModel(
    icon: PhosphorIcons.download_light,
    title: 'Memory',
    id: '61b5b083a98e0d517e9d0519',
  ),
];

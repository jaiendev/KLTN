import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CategoryModel {
  final IconData icon;
  final String title;
  bool isCheck;

  CategoryModel({
    required this.icon,
    required this.title,
    this.isCheck = false,
  });
}

final List<CategoryModel> listCategories = [
  CategoryModel(icon: PhosphorIcons.desktop_light, title: 'Screen'),
  CategoryModel(icon: PhosphorIcons.mouse_light, title: 'Mouse'),
  CategoryModel(icon: PhosphorIcons.headphones_light, title: 'Headphones'),
  CategoryModel(icon: PhosphorIcons.keyboard_light, title: 'Keyboard'),
  CategoryModel(icon: PhosphorIcons.laptop_light, title: 'Laptop'),
  CategoryModel(icon: PhosphorIcons.download_light, title: 'Memory'),
];

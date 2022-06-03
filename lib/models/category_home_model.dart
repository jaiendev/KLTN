import 'package:app_kltn_trunghoan/constants/constants.dart';

class CategoryHomeModel {
  final String icon;
  final String title;

  CategoryHomeModel({
    required this.icon,
    required this.title,
  });
}

final List<CategoryHomeModel> listCategories = [
  CategoryHomeModel(icon: icScreen, title: 'Screen'),
  CategoryHomeModel(icon: icMouse, title: 'Mouse'),
  CategoryHomeModel(icon: icHeadphone, title: 'Headphones'),
  CategoryHomeModel(icon: icKeyboard, title: 'Keyboard'),
  CategoryHomeModel(icon: icLaptop, title: 'Laptop'),
  CategoryHomeModel(icon: icMemory, title: 'Memory'),
];

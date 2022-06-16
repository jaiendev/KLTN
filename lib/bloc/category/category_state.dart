part of 'category_bloc.dart';

@immutable
abstract class CategoryState {
  List get props => [[]];
}

class CategoryInitial extends CategoryState {
  List get props => [[]];
}

class GetDoneCategory extends CategoryState {
  final List<CategoryHomeModel> categories;
  GetDoneCategory({required this.categories});

  @override
  List get props => [categories];
}

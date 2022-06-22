part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class OnProductCategoryHomeEvent extends ProductEvent {
  final String idCategory;
  OnProductCategoryHomeEvent({required this.idCategory});
}

class GetProductCategoryHomeEvent extends ProductEvent {
  final String idCategory;
  GetProductCategoryHomeEvent({required this.idCategory});
}

class ClearProductCategoryEvent extends ProductEvent {}

class AscendingEvent extends ProductEvent {
  final bool isAscending;
  final String idCategory;
  AscendingEvent({required this.isAscending, required this.idCategory});
}

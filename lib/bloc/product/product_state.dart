part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  List get props => [[]];
}

class ProductInitial extends ProductState {
  List get props => [{}, []];
}

// class GettingProductCategoryHome extends ProductState {
//   final Map<String, List<ProductModel>> products;
//   final List<ProductModel> productBanner;
//   GettingProductCategoryHome(
//       {required this.products, required this.productBanner});

//   @override
//   List get props => [products, productBanner];
// }

class GetDoneProductCategoryHome extends ProductState {
  final Map<String, List<ProductModel>> products;
  GetDoneProductCategoryHome({required this.products});

  @override
  List get props => [products];
}

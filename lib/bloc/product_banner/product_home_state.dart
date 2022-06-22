part of 'product_home_bloc.dart';

@immutable
abstract class ProductHomeState {
  List get props => [[]];
}

class ProductBannerDartInitial extends ProductHomeState {
  List get props => [[]];
}

class GetDoneProductHome extends ProductHomeState {
  final List<ProductModel> productModel;
  GetDoneProductHome({required this.productModel});

  @override
  List get props => [productModel];
}

part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  List get props => [[]];
}

class CartInitial extends CartState {
  List get props => [[]];
}

class GetDoneCartUser extends CartState {
  final List<CartModel> carts;
  GetDoneCartUser({required this.carts});

  @override
  List get props => [carts];
}

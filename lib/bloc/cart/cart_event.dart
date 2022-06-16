part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class GetCartUserEvent extends CartEvent {}

class AddProductCartEvent extends CartEvent {
  final String productId;
  final String productName;
  final int price;
  final int qty;
  final String productImage;
  AddProductCartEvent({
    required this.productId,
    required this.qty,
    required this.price,
    required this.productName,
    required this.productImage,
  });
}

class SubProductCartEvent extends CartEvent {
  final String productId;
  final String productName;
  final int price;
  final int qty;
  final String productImage;
  SubProductCartEvent({
    required this.productId,
    required this.qty,
    required this.price,
    required this.productName,
    required this.productImage,
  });
}

class PaymentVNPayEvent extends CartEvent {
  final OrderDescriptionModel orderDescriptionModel;
  PaymentVNPayEvent({required this.orderDescriptionModel});
}

class CleanCartUserEvent extends CartEvent {}

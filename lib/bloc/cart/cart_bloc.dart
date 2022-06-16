import 'package:app_kltn_trunghoan/data/remote_data_source/cart_responsitory.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/orderDescription_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());

  final List<CartModel> carts = [];

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is GetCartUserEvent) {
      if (carts.isEmpty) {
        yield CartInitial();

        await _getCart(event);
      }
      yield _getDoneCartUser;
    }
    if (event is CleanCartUserEvent) {
      carts.clear();
      yield _getDoneCartUser;
    }
    if (event is AddProductCartEvent) {
      await _addProductCart(event);
      yield _getDoneCartUser;
    }

    if (event is SubProductCartEvent) {
      await _subProductCart(event);
      yield _getDoneCartUser;
    }
    if (event is PaymentVNPayEvent) {
      await _payment(event);
      yield _getDoneCartUser;
    }
  }

  //private

  GetDoneCartUser get _getDoneCartUser => GetDoneCartUser(carts: carts);

  Future<void> _getCart(GetCartUserEvent event) async {
    List<CartModel>? _carts = await CartResponsitory().getCartUser();

    if (_carts != null) {
      carts.addAll(_carts);
    }
  }

  Future<void> _addProductCart(AddProductCartEvent event) async {
    bool _success = await CartResponsitory()
        .addProductCart(productId: event.productId, qty: 1);

    if (_success) {
      int indexOf =
          carts.indexWhere((cart) => cart.productId == event.productId);
      if (indexOf == -1) {
        carts.add(
          CartModel(
              id: '',
              productId: event.productId,
              productName: event.productName,
              productPicture: event.productImage,
              qty: event.qty,
              price: event.price),
        );
      } else {
        carts[indexOf].qty++;
      }
    } else {}
  }

  Future<void> _subProductCart(SubProductCartEvent event) async {
    bool _success = await CartResponsitory()
        .subProductCart(productId: event.productId, qty: 1);

    if (_success) {
      int indexOf =
          carts.indexWhere((cart) => cart.productId == event.productId);
      if (carts[indexOf].qty > 1) {
        carts[indexOf].qty--;
      } else {
        carts.removeAt(indexOf);
      }
    } else {}
  }

  Future<void> _payment(PaymentVNPayEvent event) async {
    String? _url = await CartResponsitory()
        .paymentVNPay(orderDescription: event.orderDescriptionModel);
    if (_url != null) {
      AppNavigator.push(
        Routes.PAYMENT_VNPAY,
        arguments: {
          'url': _url,
          'onPaymentDone': (value) {
            _handleAfterPaymentSkill(event: event, value: value);
          },
        },
      );
    } else {}
  }

  void _handleAfterPaymentSkill(
      {required PaymentVNPayEvent event, required bool? value}) {
    bool? _payOfferResult = value;
    if (_payOfferResult == null) {
      return;
    }

    if (_payOfferResult) {
      carts.clear();
    }

    AppNavigator.push(
      Routes.PAYMENT_RESULT,
      arguments: {'isSuccess': _payOfferResult},
    );
  }
}

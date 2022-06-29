import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/purchases/purchases_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_with_text_and_pop_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/data/remote_data_source/cart_responsitory.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/orderDescription_model.dart';
import 'package:app_kltn_trunghoan/models/purchase_model.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
      bool isSuccess = await _payment(
        event: event,
      );

      _handleAfterPaymentSkill(event: event, value: isSuccess);

      yield _getDoneCartUser;
    }

    if (event is DeleteProductCartEvent) {
      await _deleteProductCart(productId: event.productId);
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
    int indexOf = carts.indexWhere((cart) => cart.productId == event.productId);
    if (indexOf == -1) {
      carts.add(
        CartModel(
          id: '',
          productId: event.productId,
          productName: event.productName,
          productPicture: event.productImage,
          qty: event.qty,
          price: event.price,
        ),
      );
    } else {
      carts[indexOf].qty++;
    }
    bool _success = await CartResponsitory()
        .addProductCart(productId: event.productId, qty: event.qty);

    if (!_success) {
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Không thể xóa sản phẩm này !!',
          bodyBefore: 'Hệ thống bị lỗi',
          bodyAlign: TextAlign.center,
        ),
      );
      carts[indexOf].qty--;
      AppNavigator.pop();
    }
  }

  Future<void> _subProductCart(SubProductCartEvent event) async {
    int indexOf = carts.indexWhere((cart) => cart.productId == event.productId);
    if (carts[indexOf].qty > 1) {
      carts[indexOf].qty--;
    } else {
      carts.removeAt(indexOf);
    }
    bool _success = await CartResponsitory()
        .subProductCart(productId: event.productId, qty: 1);

    if (!_success) {
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Không thể xóa sản phẩm này !!',
          bodyBefore: 'Hệ thống bị lỗi',
          bodyAlign: TextAlign.center,
        ),
      );
      carts[indexOf].qty++;
      AppNavigator.pop();
    }
  }

  Future<bool> _payment({required PaymentVNPayEvent event}) async {
    bool _payOfferResult = false;
    final String? _url = await CartResponsitory()
        .paymentVNPay(orderDescription: event.orderDescriptionModel);

    AppNavigator.pop();
    await AppNavigator.push(
      Routes.PAYMENT_VNPAY,
      arguments: {
        'url': _url,
        'onPaymentDone': (value) {
          _payOfferResult = value;
          _handleAfterPaymentSkill(event: event, value: value);
        },
      },
    );

    return _payOfferResult;
  }

  void _handleAfterPaymentSkill(
      {required PaymentVNPayEvent event, required bool? value}) {
    bool? _payOfferResult = value;
    if (_payOfferResult == null) {
      return;
    }
    List<CartModel> _carts =
        carts.map((element) => element.copyWith()).toList();
    AppBloc.purchaseBloc.add(
      AddPurchaseEvent(
        purchaseModel: PurchaseModel(
          id: '',
          date: DateTime.now(),
          items: _carts,
          name: DateTime.now().microsecondsSinceEpoch.toString(),
          shippingAddress: event.orderDescriptionModel.shippingAddress,
          status: 0,
          totalPrice: event.orderDescriptionModel.totalPrice,
        ),
      ),
    );

    carts.clear();

    AppNavigator.push(
      Routes.PAYMENT_RESULT,
      arguments: {'isSuccess': _payOfferResult},
    );
  }

  Future<void> _deleteProductCart({required String productId}) async {
    bool _deleteSuccess =
        await CartResponsitory().deleteProductCart(productId: productId);

    if (_deleteSuccess) {
      int indexOf = carts.indexWhere((cart) => cart.productId == productId);
      if (indexOf != -1) {
        carts.removeAt(indexOf);
      }
    } else {
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Không thể xóa sản phẩm này !!',
          bodyBefore: 'Hệ thống bị lỗi',
          bodyAlign: TextAlign.center,
        ),
      );
      AppNavigator.pop();
    }
  }
}

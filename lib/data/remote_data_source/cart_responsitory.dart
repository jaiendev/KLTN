import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/orderDescription_model.dart';
import 'package:dio/dio.dart';

class CartResponsitory {
  Future<List<CartModel>?> getCartUser() async {
    Response response = await BaseRepository().getRoute(
      Endpoints.CART_USER,
    );

    if (response.statusCode == StatusCode.OK) {
      List listProduct = response.data['data']['doc']['items'];

      return listProduct.map((cart) => CartModel.fromMap(cart)).toList();
    }
    return null;
  }

  Future<bool> addProductCart({
    required String productId,
    required int qty,
  }) async {
    var body = {
      'productId': productId,
      'qty': qty,
    };
    Response response = await BaseRepository().postRoute(
      Endpoints.CART_USER,
      body,
    );

    if (response.statusCode == StatusCode.CREATED) {
      return true;
    }
    return false;
  }

  Future<bool> subProductCart({
    required String productId,
    required int qty,
  }) async {
    var body = {
      'productId': productId,
      'qty': qty,
    };
    Response response = await BaseRepository().postRoute(
      Endpoints.SUB_PRODUCT_CART,
      body,
    );

    if (response.statusCode == StatusCode.OK) {
      return true;
    }
    return false;
  }

  Future<String?> paymentVNPay({
    required OrderDescriptionModel orderDescription,
  }) async {
    var body = {
      'orderDescription': orderDescription.toMap(),
      'language': 'vn',
    };

    Response response = await BaseRepository().postRoute(
      Endpoints.PAYMENT,
      body,
    );

    if (response.statusCode == StatusCode.OK) {
      return response.data['url'];
    }
    return null;
  }
}

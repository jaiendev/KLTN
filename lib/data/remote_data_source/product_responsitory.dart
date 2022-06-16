import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductResponsitory {
  Future<List<ProductModel>?> getProductCategoryChild({
    required String idCategory,
  }) async {
    Response response = await BaseRepository().getRoute(
      Endpoints.PRODUCT_CATEGORY + '/' + '${idCategory}',
    );

    if (response.statusCode == StatusCode.OK) {
      List listProduct = response.data['sortProduct'] ?? [];

      return listProduct
          .map((product) => ProductModel.fromMap(product))
          .toList();
    }
    return null;
  }
}

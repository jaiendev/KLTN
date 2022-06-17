import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/models/purchase_model.dart';
import 'package:dio/dio.dart';

class PurchaseResponsitory {
  Future<List<PurchaseModel>?> getPurchases({
    required int status,
  }) async {
    Response response = await BaseRepository()
        .getRoute(Endpoints.PURCHASES + '?status=' + '$status');

    if (response.statusCode == StatusCode.OK) {
      List listPurchases = response.data['data']['orders'] ?? [];

      return listPurchases
          .map((purchase) => PurchaseModel.fromMap(purchase))
          .toList();
    }
    return null;
  }
}

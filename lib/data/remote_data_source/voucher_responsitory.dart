import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/models/voucher_model.dart';
import 'package:dio/dio.dart';

class VoucherResponsitory {
  Future<List<VoucherModel>?> getVoucher() async {
    Response response = await BaseRepository()
        .getRoute(Endpoints.VOUCHER + '?duration=${true}');

    if ([StatusCode.OK, StatusCode.CREATED].contains(response.statusCode)) {
      List listVoucher = response.data['data']['data'] ?? [];

      return listVoucher
          .map((voucher) => VoucherModel.fromMap(voucher))
          .toList();
    }
    return null;
  }
}

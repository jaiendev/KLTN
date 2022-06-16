import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/models/account_model.dart';
import 'package:dio/dio.dart';

class UserResponsitory {
  Future<bool> updateUser({
    required AccountModel accountModel,
  }) async {
    var body = {
      'name': accountModel.name,
      'phone': accountModel.phone,
      'address': accountModel.address,
      'photo': accountModel.photo,
    };
    Response response = await BaseRepository().patchRoute(
      Endpoints.UPDATE_USER,
      body: body,
    );

    if (response.statusCode == StatusCode.OK) {
      return true;
    }
    return false;
  }
}

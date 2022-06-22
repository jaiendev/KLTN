import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
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

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    var body = {
      'passwordCurrent': currentPassword,
      'password': newPassword,
      'passwordConfirm': confirmPassword,
    };
    Response response = await BaseRepository().patchRoute(
      Endpoints.CHANGE_PASSWORD,
      body: body,
    );

    if (response.statusCode == StatusCode.OK) {
      String token = response.data['token'];
      UserLocal().saveAccessToken(token);
      return true;
    }
    return false;
  }

  Future<AccountModel?> getInfoUser({
    required String idUser,
  }) async {
    Response response = await BaseRepository().getRoute(
      Endpoints.GET_INFO_USER + '/$idUser',
    );

    if (response.statusCode == StatusCode.OK) {
      var dataJson = response.data['data'];
      Map<String, dynamic> infoUser = dataJson['userData'];

      AccountModel accountModel = AccountModel.fromMap(infoUser);

      UserLocal().saveAccount(accountModel);

      return accountModel;
    }
    return null;
  }
}

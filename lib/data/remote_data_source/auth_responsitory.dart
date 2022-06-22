import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/models/account_model.dart';
import 'package:app_kltn_trunghoan/models/enums/authenication_fail.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<AccountModel?> login({
    required String email,
    required String password,
  }) async {
    Response response = await BaseRepository().postRoute(
      Endpoints.LOGIN,
      {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == StatusCode.OK) {
      var dataJson = response.data['data'];
      String token = response.data['token'];
      Map<String, dynamic> infoUser = dataJson['user'];

      AccountModel accountModel = AccountModel.fromMap(infoUser);

      UserLocal().saveAccessToken(token);
      UserLocal().saveAccount(accountModel);

      return accountModel;
    } else {
      String message = response.data['message'];
      if (message == 'Incorrect email or password') {
        throw AuthenticationException.WRONG_PASSWORD;
      }
      if (message == 'Account not verified!') {
        throw AuthenticationException.DONT_VERIFY;
      }
    }
    return null;
  }

  Future<AccountModel?> register({
    required String email,
    required String password,
    required String fullname,
    required String passwordConfirm,
  }) async {
    var body = {
      'email': email,
      'password': password,
      'name': fullname,
      'passwordConfirm': passwordConfirm
    };

    Response response = await BaseRepository().postRoute(
      Endpoints.REGISTER,
      body,
    );

    if (response.statusCode == StatusCode.CREATED) {
      var dataJson = response.data['data']['user'];
      AccountModel accountModel = AccountModel.fromMap(dataJson);
      return accountModel;
    } else {
      return null;
    }
  }

  Future<bool> forgotPassword({
    required String email,
  }) async {
    var body = {
      'email': email,
    };

    Response response =
        await BaseRepository().postRoute(Endpoints.FORGOT_PASSWORD, body);

    return response.statusCode == StatusCode.OK;
  }
}

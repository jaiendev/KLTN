import 'dart:async';
import 'dart:convert' as convert;
import 'package:app_kltn_trunghoan/configs/application.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/helpers/logger.dart';
import 'package:app_kltn_trunghoan/helpers/utils/stop_watch.dart';

import 'package:dio/dio.dart' as diox;

class BaseRepository {
  var dio = diox.Dio(diox.BaseOptions(
    baseUrl: Application.baseUrl,
    connectTimeout: CONNECT_TIME_OUT,
    receiveTimeout: RECEIVE_TIME_OUT,
  )); // with default Options

  Future<diox.Response<dynamic>> downloadFile(
      String url, String path, Function onReceive) async {
    var response = await dio.download(
      url,
      path,
      options: getOptions(),
      onReceiveProgress: (received, total) {
        onReceive(received, total);
      },
    );
    return response;
  }

  Future<diox.Response<dynamic>> sendFormData(
    String gateway,
    diox.FormData formData,
  ) async {
    try {
      var response = await dio.post(
        gateway,
        data: formData,
        options: getOptions(),
        onSendProgress: (send, total) {
          // AppBloc.progressBloc.add(UpdateProgressSendEvent(
          //   progress: send / total,
          // ));
        },
        onReceiveProgress: (received, total) {
          // AppBloc.progressBloc.add(UpdateProgressReceiveEvent(
          //   progress: received / total,
          // ));
        },
      );

      return response;
    } on diox.DioError catch (exception) {
      catchDioError(exception);
      throw Exception(exception.message);
    }
  }

  Future<diox.Response<dynamic>> putFormData(
    String gateway,
    diox.FormData formData,
  ) async {
    try {
      var response = await dio.put(
        gateway,
        data: formData,
        options: getOptions(),
        onSendProgress: (send, total) {
          // AppBloc.progressBloc.add(UpdateProgressSendEvent(
          //   progress: send / total,
          // ));
        },
        onReceiveProgress: (received, total) {
          // AppBloc.progressBloc.add(UpdateProgressReceiveEvent(
          //   progress: received / total,
          // ));
        },
      );
      return response;
    } on diox.DioError catch (exception) {
      catchDioError(exception);
      throw Exception(exception.message);
    }
  }

  Future<diox.Response<dynamic>> postRoute(
      String gateway, Map<String, dynamic> body,
      {String? query}) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }
      var response = Application.mode == MODE_DEV
          ? await stopWatchApi(
              () => dio.post(
                    gateway,
                    data: convert.jsonEncode(body),
                    options: getOptions(),
                    queryParameters: query == null ? null : paramsObject,
                  ),
              POST,
              gateway)
          : await dio.post(
              gateway,
              data: convert.jsonEncode(body),
              options: getOptions(),
              queryParameters: query == null ? null : paramsObject,
            );
      return response;
    } on diox.DioError catch (exception) {
      catchDioError(exception);
      throw Exception(exception.message);
    }
  }

  Future<diox.Response<dynamic>> putRoute(
    String gateway,
    Map<String, dynamic> body,
  ) async {
    try {
      var response = Application.mode == MODE_DEV
          ? await stopWatchApi(
              () => dio.put(
                    gateway,
                    data: convert.jsonEncode(body),
                    options: getOptions(),
                  ),
              PUT,
              gateway)
          : await dio.put(
              gateway,
              data: convert.jsonEncode(body),
              options: getOptions(),
            );
      return response;
    } on diox.DioError catch (exception) {
      catchDioError(exception);
      throw Exception(exception.message);
    }
  }

  Future<diox.Response<dynamic>> patchRoute(
    String gateway, {
    String? query,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }

      var response = Application.mode == MODE_DEV
          ? await stopWatchApi(
              () => dio.patch(
                    gateway,
                    data: body == null ? null : convert.jsonEncode(body),
                    options: getOptions(),
                    queryParameters: query == null ? null : paramsObject,
                  ),
              PATCH,
              gateway)
          : await dio.patch(
              gateway,
              data: body == null ? null : convert.jsonEncode(body),
              options: getOptions(),
              queryParameters: query == null ? null : paramsObject,
            );
      return response;
    } on diox.DioError catch (exception) {
      catchDioError(exception);
      throw Exception(exception.message);
    }
  }

  Future<diox.Response<dynamic>> getRoute(
    String gateway, {
    String? params,
    String? query,
  }) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }

      var response = await dio.get(
        gateway,
        options: getOptions(),
        queryParameters: query == null ? null : paramsObject,
      );
      return response;
    } on diox.DioError catch (exception) {
      catchDioError(exception);
      throw Exception(exception.message);
    }
  }

  Future<diox.Response<dynamic>> deleteRoute(
    String gateway, {
    String? params,
    String? query,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }

      var response = Application.mode == MODE_DEV
          ? await stopWatchApi(
              () => dio.delete(
                    gateway,
                    options: getOptions(),
                    queryParameters: query == null ? null : paramsObject,
                  ),
              DELETE,
              gateway)
          : await dio.delete(
              gateway,
              options: getOptions(),
              queryParameters: query == null ? null : paramsObject,
            );
      return response;
    } on diox.DioError catch (exception) {
      throw Exception(exception.message);
    }
  }

  diox.Options getOptions() {
    return diox.Options(
      validateStatus: (status) {
        if ([StatusCode.validateStatus].contains(status)) {
          UtilLogger.log('FETCH ERROR', 'Status code: $status');
        }
        return true;
      },
      headers: getHeaders(),
    );
  }

  getHeaders() {
    return {
      'Authorization': 'Bearer ' +
          (UserLocal().getAccessToken().isEmpty
              ? UserLocal().getBackupToken()
              : UserLocal().getAccessToken()),
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
    };
  }

  printEndpoint(String method, String endpoint) {
    print('${method.toUpperCase()}: $endpoint');
  }

  printResponse(diox.Response<dynamic> response) {
    print('StatusCode: ${response.statusCode}');
    print('Body: ${response.data.toString()}');
  }

  Future<diox.Response> getCancelReasons({String child = 'reasons'}) async {
    var response = await dio.get(child);
    return response;
  }

  catchDioError(diox.DioError exception) {
    if (exception.type == diox.DioErrorType.connectTimeout ||
        exception.type == diox.DioErrorType.receiveTimeout) {
      throw exception;
    }
  }
}

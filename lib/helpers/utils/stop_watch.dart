import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/logger.dart';
import 'package:dio/dio.dart';

Future<Response> stopWatchApi(
    Future<Response> Function() next, String method, String endpoint) async {
  DateTime startTime = DateTime.now();
  var result = await next();
  DateTime endTime = DateTime.now();
  int duration = endTime.difference(startTime).inMilliseconds;
  if (duration >= LIMIT_RESPONSE_TIME) {
    UtilLogger.log(
        'WARNING RESPONSE TIME', '**********************************');
    UtilLogger.log(
        'WARNING RESPONSE TIME', '$method: $endpoint - ${duration}ms\n');
    UtilLogger.log(
        'WARNING RESPONSE TIME', '**********************************');
  }
  return result;
}

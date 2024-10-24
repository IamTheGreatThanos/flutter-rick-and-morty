// import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
// import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioClient {
  static late DioClient _instance;
  late Dio _http;

  static get instance {
    _instance = DioClient._internal();

    return _instance;
  }

  DioClient._internal() {
    BaseOptions options = BaseOptions(
      followRedirects: true,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      sendTimeout: const Duration(seconds: 10),
    );
    debugPrint("INITING dio");
    _http = Dio(options);
    _http.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
            // printRequestHeaders: true,
            // printResponseHeaders: true,
            printResponseMessage: true,
            printRequestData: true
            // printResponseData: true,
            ),
      ),
    );
  }

  factory DioClient() => DioClient._internal();

  Dio get client => _http;

  dispose() {
    _http.close();
  }
}

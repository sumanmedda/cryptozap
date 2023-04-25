import 'package:cryptozap/controller/const/const.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = mainHost;
    _dio.options.queryParameters = {
      "vs_currency": "usd",
    };
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}

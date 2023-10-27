import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef OnError = void Function(
  dynamic error, {
  String? info,
  bool? sendErrorInfo,
});

//Flavor check!
const String flavor = String.fromEnvironment('app.flavor');

class ApiService {
  factory ApiService() => _instance ??= ApiService._();
  ApiService._();

  static const SIMPSONS_API =
      'http://api.duckduckgo.com/?q=simpsons+characters&format=json';
  static const WIRE_API =
      'http://api.duckduckgo.com/?q=the+wire+characters&format=json'; //Default if no flavor set

  static ApiService? _instance;

  final String baseAPI = flavor == 'simpsons' ? SIMPSONS_API : WIRE_API;

  static const _timeout = 30000;

  OnError? errorCallback;

  Dio _dio() {
    final options = BaseOptions(
      baseUrl: baseAPI,
      connectTimeout: Duration(milliseconds: _timeout),
      receiveTimeout: Duration(milliseconds: _timeout),
    );

    final dio = Dio(options);

    return dio;
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return _dio().post<T>(path, data: data);
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return _dio().get<T>(path);
  }

  void notifyError(dynamic error, {String? info, bool sendErrorInfo = false}) {
    if (errorCallback != null) {
      if (error is DioError) {
        errorCallback!(
          error.error,
          info: error.toString(),
          sendErrorInfo: sendErrorInfo,
        );
      } else {
        errorCallback!(error, info: info, sendErrorInfo: sendErrorInfo);
      }
    } else {
      debugPrint('Api - Error callback not attached');
    }
  }
}

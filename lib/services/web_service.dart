import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:leadsdoit/model/soccer.dart';

class WebService {
  static final WebService _singleton = WebService._internal();

  factory WebService() {
    return _singleton;
  }

  WebService._internal();

  Dio _dio = GetIt.instance.get<Dio>();

  void updateDio(Dio dio) {
    _dio = dio;
  }

  Future<Soccer> getSoccer() async {
    try {
      final response = await _dio.get('/v1/json/2/latestsoccer.php');
      if (kDebugMode) {
        print('getSoccer data: ${response.data}');
      }

      return Soccer.fromJson(response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print('getSoccer $e');
      }

      return Future.error(e);
    }
  }

  Future<Object?> getPreloadLink() async {
    try {
      final response = Uri.parse('https://kueski.shop/cq1al3k.php?key=9ckcsrbnkseenkjkuh04');
      if (kDebugMode) {
        print('getPreloadLink data: ${response.data}');
      }

      return response.data;
    } on DioError catch (e) {
      if (kDebugMode) {
        print('getPreloadLink $e');
      }

      return Future.error(e);
    }
  }
}

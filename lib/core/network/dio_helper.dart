import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/network/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static dioInit() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: AppEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest({
    required String endPoins,
    required Map<String, dynamic> queryMaps,
  }) async {
    try {
      var response = await dio!.get(endPoins, queryParameters: queryMaps);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}

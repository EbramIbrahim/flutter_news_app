import 'dart:developer';

import 'package:news_app/core/constant/app_constant.dart';
import 'package:news_app/core/network/dio_helper.dart';
import 'package:news_app/core/network/end_points.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';

class HomeRepository {
  getTopHeadlines() async {
    try {
      final response = await DioHelper.getRequest(
        endPoins: AppEndPoints.topHeadlines,
        queryMaps: {"apiKey": AppConstant.apiKey, "country": "us"},
      );

      if (response.statusCode == 200) {
        NewsModels topHeadlinesModel = NewsModels.fromJson(response.data);
        log(topHeadlinesModel.totalResults.toString());
        return topHeadlinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}

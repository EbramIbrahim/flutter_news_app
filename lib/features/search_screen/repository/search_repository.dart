import 'dart:developer';

import 'package:news_app/core/constant/app_constant.dart';
import 'package:news_app/core/network/dio_helper.dart';
import 'package:news_app/core/network/end_points.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';

class SearchRepository {
  searchNews(String q) async {
    try {
      final response = await DioHelper.getRequest(
        endPoins: AppEndPoints.everything,
        queryMaps: {
          "apiKey": AppConstant.apiKey,
          "q": q,
          "language": AppConstant.language,
        },
      );
      if (response.statusCode == 200) {
        NewsModels newsModels = NewsModels.fromJson(response.data);
        log(newsModels.toString());
        return newsModels;
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

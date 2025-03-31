import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_styles.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height:
                  orientation == Orientation.portrait
                      ? height * 0.3
                      : height * 0.5,
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    "https://marketplace.canva.com/EAGD3XkUBK0/1/0/1600w/canva-red-and-white-general-news-breaking-news-video-8HCnEsJgmXA.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: orientation == Orientation.portrait ? 300.h : 500.h,
              child: Container(
                width: width,
                height: height * 0.8,
                padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        article.title ?? "",
                        maxLines: 2,
                        style: AppStyles.black16W500TextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "${article.author} . ${article.publishedAt}",
                        style: AppStyles.gray12MediumTextStyle,
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          article.description ?? "",
                          style: AppStyles.black16W500TextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

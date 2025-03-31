import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styling/app_styles.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';

class ArticleCardWidget extends StatelessWidget {
  final Article article;

  const ArticleCardWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRouter.newsDetailsScreen, extra: article);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Text(
                    article.title ?? "",
                    maxLines: 2,
                    style: AppStyles.black16W500TextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: width * 0.4,
                  child: Text(
                    "${article.author} . ${article.publishedAt}",
                    style: AppStyles.gray12MediumTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 112.w,
              height: orientation == Orientation.portrait ? 80.h : 100.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl:
                      article.urlToImage ??
                      "https://marketplace.canva.com/EAGD3XkUBK0/1/0/1600w/canva-red-and-white-general-news-breaking-news-video-8HCnEsJgmXA.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

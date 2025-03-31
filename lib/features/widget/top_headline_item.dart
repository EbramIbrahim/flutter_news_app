import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styling/app_styles.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';

class TopHeadlineItem extends StatelessWidget {
  final Article article;
  final double height;

  const TopHeadlineItem({
    super.key,
    required this.article,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRouter.newsDetailsScreen, extra: article);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    "https://marketplace.canva.com/EAGD3XkUBK0/1/0/1600w/canva-red-and-white-general-news-breaking-news-video-8HCnEsJgmXA.jpg",
                height: height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            article.title ?? "",
            style: AppStyles.black16W500TextStyle.copyWith(fontSize: 18),
          ),
          SizedBox(height: 12.h),
          Text(
            "${article.author} . ${article.publishedAt}",
            style: AppStyles.gray12MediumTextStyle,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  final String? title;
  const CustomCategoryItem({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12),
      child: OutlinedButton(
        onPressed: () {
          GoRouter.of(
            context,
          ).pushNamed(AppRouter.searchResultScreen, extra: title);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          overlayColor: AppColors.appBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56.r),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
        ),
        child: Text(title ?? "", style: AppStyles.black16W500TextStyle),
      ),
    );
  }
}

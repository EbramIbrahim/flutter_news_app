import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';

class AppStyles {
  static TextStyle headLineTextStyle = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle titleTextStyle = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle subtitleTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );

  static TextStyle black16W500TextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle gray12MediumTextStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrayColor,
  );

  static TextStyle hintTextStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor,
  );
}

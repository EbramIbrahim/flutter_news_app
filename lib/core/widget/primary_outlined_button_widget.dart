import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? borderRadius;
  final void Function()? onPress;

  const PrimaryOutlinedButtonWidget({
    super.key,
    this.buttonText,
    this.textColor,
    this.fontSize,
    this.width,
    this.height,
    this.borderRadius,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          side: BorderSide(color: AppColors.primaryColor),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(
          color: textColor ?? AppColors.primaryColor,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}

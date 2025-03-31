import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final String? buttonText;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final void Function()? onPress;

  const PrimaryButtonWidget({
    super.key,
    this.buttonColor,
    this.buttonText,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_styles.dart';

class PrimaryTextfieldWidget extends StatelessWidget {
  final String? hintText;
  final double? width;
  final Widget? suffixIcon;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PrimaryTextfieldWidget({
    super.key,
    this.hintText,
    this.width,
    this.suffixIcon,
    this.isPassword,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: false,
        cursorColor: AppColors.primaryColor,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: AppStyles.hintTextStyle,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.textFieldStroke, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
          filled: true,
          fillColor: AppColors.textFieldFill,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

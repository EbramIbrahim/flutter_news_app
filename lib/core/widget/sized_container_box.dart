import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';

class SizedContainerBox extends StatelessWidget {
  final String? image;
  final void Function()? onTap;
  const SizedContainerBox({super.key, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: orientation == Orientation.portrait ? 105.w : 90.w,
        height: orientation == Orientation.portrait ? 56.h : 106.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.textFieldStroke, width: 1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Image.asset(
            image ?? "",
            width: orientation == Orientation.portrait ? 26.w : 56.w,
            height: orientation == Orientation.portrait ? 26.h : 56.h,
          ),
        ),
      ),
    );
  }
}

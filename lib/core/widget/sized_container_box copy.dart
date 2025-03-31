import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';

class SizedContainerBox extends StatelessWidget {
  final String? image;
  const SizedContainerBox({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.textFieldStroke, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(child: Image.asset(image ?? "", width: 26.w, height: 26.h)),
    );
  }
}

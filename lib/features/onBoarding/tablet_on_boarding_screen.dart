import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styling/app_assets.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/widget/primary_button_widget.dart';
import 'package:news_app/core/widget/primary_outlined_button_widget.dart';

class TabletOnBoardingScreen extends StatelessWidget {
  const TabletOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: width * 0.4,
            height: height,
            child: Image.asset(AppAssets.onBoard),
          ),
          SizedBox(width: 21),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButtonWidget(
                onPress: () {
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.loginScreen);
                },
                buttonColor: AppColors.primaryColor,
                buttonText: "login".tr(),
                textColor: AppColors.white,
              ),
              SizedBox(height: 15),
              PrimaryOutlinedButtonWidget(
                onPress: () {
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.registerScreen);
                },
                buttonText: "register".tr(),
                textColor: AppColors.primaryColor,
                fontSize: 15.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styling/app_assets.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/widget/primary_button_widget.dart';
import 'package:news_app/core/widget/primary_outlined_button_widget.dart';

class PhoneOnBoardingScreen extends StatelessWidget {
  const PhoneOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: 570.h,
              child: Image.asset(AppAssets.onBoard),
            ),
            SizedBox(height: 21),
            PrimaryButtonWidget(
              onPress: () {
                GoRouter.of(
                  context,
                ).pushReplacementNamed(AppRouter.loginScreen);
              },
              buttonColor: AppColors.primaryColor,
              buttonText: "login".tr(),
              textColor: AppColors.white,
              width:
                  orientation == Orientation.landscape
                      ? width * 0.6
                      : width * 0.8,
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
              width:
                  orientation == Orientation.landscape
                      ? width * 0.6
                      : width * 0.8,
            ),
            SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}

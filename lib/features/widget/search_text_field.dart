import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/features/widget/custom_text_field.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchTextField();
  }
}

class _SearchTextField extends State<SearchTextField> {
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextField
            ? CustomTextField(
              width: 220.w,
              hintText: "search".tr(),
              onFieldSubmitted: (value) {
                GoRouter.of(
                  context,
                ).pushNamed(AppRouter.searchResultScreen, extra: value);
              },
            )
            : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showTextField = !showTextField;
            });
          },
          icon: Icon(Icons.search, color: AppColors.blackColor),
        ),
      ],
    );
  }
}

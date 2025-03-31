import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constant/app_constant.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_styles.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/cubit/home_states.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';
import 'package:news_app/features/widget/article_card_widget.dart';
import 'package:news_app/features/widget/custom_category_item.dart';
import 'package:news_app/features/widget/search_text_field.dart';
import 'package:news_app/features/widget/top_headline_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        toolbarHeight: 120.h,
        title: Text("explore".tr(), style: AppStyles.titleTextStyle),
        actions: [
          SearchTextField(),
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(Locale("ar"));
              } else {
                context.setLocale(Locale("en"));
              }
              AppConstant.language = context.locale.languageCode;
            },
            icon: Icon(Icons.language, color: AppColors.blackColor),
          ),
          IconButton(
            onPressed: () {
              // SignOut
            },
            icon: Icon(Icons.logout_outlined, color: AppColors.blackColor),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is LoadingTopHeadlinesState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            );
          }
          if (state is ErrorTopHeadlinesState) {
            return Center(child: Text(state.error.toString()));
          }
          if (state is SuccessTopHeadlinesState) {
            NewsModels topHeadlinesModels = state.topHeadline;
            return Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.w),
                  child: SizedBox(
                    height: orientation == Orientation.portrait ? 40 : 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        CustomCategoryItem(title: "travel".tr()),
                        CustomCategoryItem(title: "technology".tr()),
                        CustomCategoryItem(title: "business".tr()),
                        CustomCategoryItem(title: "entertainment".tr()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      TopHeadlineItem(
                        article: topHeadlinesModels.articles![0],
                        height:
                            orientation == Orientation.portrait ? 206.h : 306.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: topHeadlinesModels.articles!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Article article = topHeadlinesModels.articles![index];
                        return ArticleCardWidget(article: article);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}

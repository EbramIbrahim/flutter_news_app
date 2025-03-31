import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_styles.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';
import 'package:news_app/features/search_screen/cubit/search_cubit.dart';
import 'package:news_app/features/search_screen/cubit/search_state.dart';
import 'package:news_app/features/widget/article_card_widget.dart';

class SearchResultScreen extends StatefulWidget {
  final String query;

  const SearchResultScreen({super.key, required this.query});

  @override
  State<StatefulWidget> createState() {
    return _SearchResultScreen(query);
  }
}

class _SearchResultScreen extends State<SearchResultScreen> {
  final String query;
  _SearchResultScreen(this.query);
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().searchNews(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "search_result".tr(),
          style: AppStyles.black16W500TextStyle.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: AppColors.blackColor),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is LoadingSearchResult) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            );
          }
          if (state is ErrorSearchResult) {
            return Center(child: Text(state.error.toString()));
          }
          if (state is SuccessSearchResult) {
            NewsModels newsModels = state.searchResults;
            return Column(
              children: [
                SizedBox(height: 24.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: newsModels.articles!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Article article = newsModels.articles![index];
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

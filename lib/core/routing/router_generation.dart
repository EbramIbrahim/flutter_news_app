import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/features/article_details_screen/article_details_screen.dart';
import 'package:news_app/features/auth/login_screen/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/login_screen/login_screen.dart';
import 'package:news_app/features/auth/register_screen/register_cubit/register_cubit.dart';
import 'package:news_app/features/auth/register_screen/register_screen.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/home_screen.dart';
import 'package:news_app/features/home_screen/models/news_models.dart';
import 'package:news_app/features/onBoarding/on_boarding_screen.dart';
import 'package:news_app/features/search_screen/cubit/search_cubit.dart';
import 'package:news_app/features/search_screen/search_result_screen.dart';

class RouterGeneration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRouter.onBoardingScreen,
        name: AppRouter.onBoardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRouter.loginScreen,
        name: AppRouter.loginScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginScreen(),
            ),
      ),
      GoRoute(
        path: AppRouter.registerScreen,
        name: AppRouter.registerScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: RegisterScreen(),
            ),
      ),
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => HomeCubit(),
              child: HomeScreen(),
            ),
      ),
      GoRoute(
        path: AppRouter.searchResultScreen,
        name: AppRouter.searchResultScreen,
        builder: (context, state) {
          String query = state.extra as String;
          return BlocProvider(
            create: (context) => SearchCubit(),
            child: SearchResultScreen(query: query),
          );
        },
      ),
      GoRoute(
        path: AppRouter.newsDetailsScreen,
        name: AppRouter.newsDetailsScreen,
        builder: (context, state) {
          Article article = state.extra as Article;
          return ArticleDetailsScreen(article: article);
        },
      ),
    ],
  );
}

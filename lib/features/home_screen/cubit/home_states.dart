import 'package:news_app/features/home_screen/models/news_models.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class LoadingTopHeadlinesState extends HomeStates {}

class SuccessTopHeadlinesState extends HomeStates {
  final NewsModels topHeadline;
  SuccessTopHeadlinesState(this.topHeadline);
}

class ErrorTopHeadlinesState extends HomeStates {
  final String error;
  ErrorTopHeadlinesState(this.error);
}

class SuccessSignOut extends HomeStates {}

class ErrorSignOut extends HomeStates {
  final String error;
  ErrorSignOut(this.error);
}

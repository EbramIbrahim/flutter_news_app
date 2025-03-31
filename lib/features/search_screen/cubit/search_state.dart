import 'package:news_app/features/home_screen/models/news_models.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class LoadingSearchResult extends SearchState {}

class SuccessSearchResult extends SearchState {
  final NewsModels searchResults;
  SuccessSearchResult(this.searchResults);
}

class ErrorSearchResult extends SearchState {
  final String error;
  ErrorSearchResult(this.error);
}

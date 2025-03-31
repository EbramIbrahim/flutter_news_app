import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_screen/cubit/search_state.dart';
import 'package:news_app/features/search_screen/repository/search_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  final SearchRepository searchRepository = SearchRepository();
  Future<void> searchNews(String query) async {
    emit(LoadingSearchResult());
    try {
      final response = await searchRepository.searchNews(query);
      emit(SuccessSearchResult(response));
    } catch (e) {
      emit(ErrorSearchResult(e.toString()));
    }
  }
}

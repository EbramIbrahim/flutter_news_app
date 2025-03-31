import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/repository/firebase_auth_repository.dart';
import 'package:news_app/features/home_screen/cubit/home_states.dart';
import 'package:news_app/features/home_screen/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  final HomeRepository homeRepository = HomeRepository();
  final FirebaseAuthRepository repository = FirebaseAuthRepository();

  Future<void> getTopHeadlines() async {
    emit(LoadingTopHeadlinesState());
    try {
      final response = await homeRepository.getTopHeadlines();
      emit(SuccessTopHeadlinesState(response));
    } catch (e) {
      emit(ErrorTopHeadlinesState(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await repository.signout();
      emit(SuccessSignOut());
    } catch (e) {
      emit(ErrorSignOut(e.toString()));
    }
  }
}

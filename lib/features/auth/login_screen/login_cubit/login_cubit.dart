import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/login_screen/login_cubit/login_states.dart';
import 'package:news_app/features/auth/repository/firebase_auth_repository.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLogin());

  final FirebaseAuthRepository repository = FirebaseAuthRepository();

  Future<void> login(String email, String password) async {
    emit(LoadingLogin());
    try {
      await repository.login(email, password);
      emit(SuccessLogin("Successfully Register"));
    } catch (e) {
      emit(ErrorRLogin(e.toString()));
    }
  }

  Future<void> googleSignIn() async {
    emit(LoadingLogin());
    try {
      await repository.signInWithGoogle();
      emit(SuccessLogin("SuccessLogin Register"));
    } catch (e) {
      emit(ErrorRLogin(e.toString()));
    }
  }
}

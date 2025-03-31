import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/register_screen/register_cubit/register_states.dart';
import 'package:news_app/features/auth/repository/firebase_auth_repository.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegister());

  final FirebaseAuthRepository repository = FirebaseAuthRepository();

  Future<void> register(String email, String password, String name) async {
    emit(LoadingRegister());
    try {
      await repository.register(email, password, name);
      emit(SuccessRegister("Successfully Register"));
    } catch (e) {
      emit(ErrorRegister(e.toString()));
    }
  }

  Future<void> googleSignIn() async {
    emit(LoadingRegister());
    try {
      await repository.signInWithGoogle();
      emit(SuccessRegister("Successfully Register"));
    } catch (e) {
      emit(ErrorRegister(e.toString()));
    }
  }
}

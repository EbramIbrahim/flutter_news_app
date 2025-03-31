abstract class LoginStates {}

class InitialLogin extends LoginStates {}

class LoadingLogin extends LoginStates {}

class SuccessLogin extends LoginStates {
  final String message;
  SuccessLogin(this.message);
}

class ErrorRLogin extends LoginStates {
  final String message;
  ErrorRLogin(this.message);
}

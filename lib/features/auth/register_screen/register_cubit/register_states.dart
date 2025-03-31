abstract class RegisterStates {}

class InitialRegister extends RegisterStates {}

class LoadingRegister extends RegisterStates {}

class SuccessRegister extends RegisterStates {
  final String message;
  SuccessRegister(this.message);
}

class ErrorRegister extends RegisterStates {
  final String message;
  ErrorRegister(this.message);
}

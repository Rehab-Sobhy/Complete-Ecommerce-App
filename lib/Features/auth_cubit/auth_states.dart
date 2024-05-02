abstract class AuthState {}

class IntialAuthState extends AuthState {}

class RegisterSuccsess extends AuthState {}

class RegisterFailed extends AuthState {
  late String message;
  RegisterFailed({required this.message});
}

class RegisterLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailed extends AuthState {
  late String message;
  LoginFailed({required this.message});
}

class LoginLoading extends AuthState {}

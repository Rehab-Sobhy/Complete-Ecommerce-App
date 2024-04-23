abstract class AuthState {}

class IntialAuthState extends AuthState {}

class RegisterSuccsess extends AuthState {}

class RegisterFailed extends AuthState {
  late String message;
  RegisterFailed({required this.message});
}

class RegisterLoading extends AuthState {}

class LginSuccsess extends AuthState {}

class LginFailed extends AuthState {
  late String message;
  LginFailed({required this.message});
}

class LginLoading extends AuthState {}

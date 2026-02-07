part of 'login_bloc.dart';



abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  final String token;

  LoginSuccess({
    required this.user,
    required this.token,
  });
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
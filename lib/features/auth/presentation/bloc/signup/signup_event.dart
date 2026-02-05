part of 'signup_bloc.dart';

// @immutable
// sealed class SignupEvent {}

abstract class SignupEvent extends Equatable{
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SignupButtonPressed extends SignupEvent{
  final String name;
  final String email;
  final String password;
  const SignupButtonPressed({required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password];
}
class SignupReset extends SignupEvent{
  const SignupReset();
}
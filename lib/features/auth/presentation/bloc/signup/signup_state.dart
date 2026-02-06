part of 'signup_bloc.dart';

// @immutable
// sealed class SignupState {}
//
// final class SignupInitial extends SignupState {}

abstract class SignupState extends Equatable{
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState{
  const SignupInitial();
}
class SignupLoading extends SignupState{
  const SignupLoading();
}
class SignupSuccess extends SignupState{
  final User user;
  final String token;
  const SignupSuccess(this.user, this.token);
  @override
  List<Object?> get props => [user, token];
}
class SignupFailure extends SignupState{
  final String message;
  const SignupFailure(this.message);
  @override
  List<Object?> get props => [message];
}



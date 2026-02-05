import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/login_request.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(const LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LoginReset>(_onLoginReset);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event,
      Emitter<LoginState> emit,
      ) async {
    emit(const LoginLoading());

    final request = LoginRequest(
      email: event.email,
      password: event.password,
    );

    final result = await loginUseCase(request);

    result.fold(
          (failure) => emit(LoginFailure(failure.message)),
          (data) => emit(LoginSuccess(user: data.user, token: data.token)),
    );
  }

  void _onLoginReset(
      LoginReset event,
      Emitter<LoginState> emit,
      ) {
    emit(const LoginInitial());
  }
}
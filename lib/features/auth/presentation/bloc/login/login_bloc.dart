import 'package:bloc/bloc.dart';
import '../../../data/model/login_request.dart';
import '../../../data/model/user.dart';
import '../../../data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';




class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LoginReset>(_onLoginReset);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoading());

    try {
      final request = LoginRequest(
        email: event.email,
        password: event.password,
      );

      final response = await repository.login(request);

      if (response.success && response.user != null && response.token != null) {
        emit(LoginSuccess(
          user: response.user!,
          token: response.token!,
        ));
      } else {
        emit(LoginFailure(response.message));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }
}
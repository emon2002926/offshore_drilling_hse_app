import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:offshore_drilling_hse_app/features/auth/presentation/bloc/login/login_bloc.dart';

import '../../../domain/entities/sign_up_request.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/signup_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase signUpUseCase;
  SignupBloc({required this.signUpUseCase}) : super(SignupInitial()) {
    on<SignupButtonPressed>(_onSignupButtonPressed);
    on<SignupReset>(_onSignupReset);
  }
  Future<void> _onSignupButtonPressed(
      SignupButtonPressed event,
      Emitter<SignupState> emit,
      )async {
    emit(const SignupLoading());
    final request = SignUpRequest(
      name: event.name,
      email: event.email,
      password: event.password,
      phone :"01711121",
      date_of_birth:"1980-04-20",
      gender:"Male",);

    final result = await signUpUseCase(request);

    result.fold((failure) =>emit(SignupFailure(failure.message)),
          (data) => emit(SignupSuccess( data.user,data.token)),
    );
  }

  void _onSignupReset(
      SignupReset event,
      Emitter<SignupState> emit,
      ){
    emit(const SignupInitial());
  }
}

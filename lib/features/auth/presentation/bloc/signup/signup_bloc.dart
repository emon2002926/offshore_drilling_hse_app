import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/signup_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase signUpUseCase;
  SignupBloc({required this.signUpUseCase}) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
    });
  }
}


import 'package:dartz/dartz.dart';
import 'package:offshore_drilling_hse_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/sign_up_request.dart';
import '../entities/user.dart';

class SignUpUseCase{
  final  AuthRepository repository;
  SignUpUseCase(this.repository);

  Future<Either<Failure, ({User user, String token})>> call(SignUpRequest request) {
    return repository.signUp(request);
  }

}
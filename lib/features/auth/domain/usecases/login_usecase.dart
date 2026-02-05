import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_request.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, ({User user, String token})>> call(LoginRequest request) {
    return repository.login(request);
  }
}
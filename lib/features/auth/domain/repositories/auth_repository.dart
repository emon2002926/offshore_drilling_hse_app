import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_request.dart';
import '../entities/sign_up_request.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, ({User user, String token})>> login(LoginRequest request);
  Future<Either<Failure, ({User user, String token})>> signUp(SignUpRequest request);
}
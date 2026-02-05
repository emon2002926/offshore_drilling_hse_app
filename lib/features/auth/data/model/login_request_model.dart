import '../../domain/entities/login_request.dart';

class LoginRequestModel extends LoginRequest {
  const LoginRequestModel({
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginRequestModel.fromEntity(LoginRequest entity) {
    return LoginRequestModel(
      email: entity.email,
      password: entity.password,
    );
  }
}
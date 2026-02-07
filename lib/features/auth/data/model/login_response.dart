import 'user.dart';

class LoginResponse {
  final bool success;
  final String message;
  final String? token;
  final User? user;

  LoginResponse({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['data']?['token'],
      user: json['data']?['user'] != null
          ? User.fromJson(json['data']['user'])
          : null,
    );
  }
}
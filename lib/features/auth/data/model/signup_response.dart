
import 'package:offshore_drilling_hse_app/features/auth/data/model/user.dart';

class SignupResponse {
  final bool success;
  final String message;
  final String? token;
  final User? user;

  SignupResponse({
    required this.success,
    required this.message,
    this.token,
    this.user
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['data']?['token'],
      user: json['data']?['user'] != null
          ? User.fromJson(json['data']['user'])
          : null,
    );
  }
}
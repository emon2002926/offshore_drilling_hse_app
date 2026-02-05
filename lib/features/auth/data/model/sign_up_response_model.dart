import '../../domain/entities/user.dart';

class SignUpResponseModel{

  final bool success;
  final String message;
  final DataModel data;
  SignUpResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignUpResponseModel.fromJson(Map<String ,dynamic>json){
    return SignUpResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: DataModel.fromJson(json['data'] ?? {}),
    );
  }
}
class DataModel {
  final String token;
  final UserModel user;

  DataModel({
    required this.token,
    required this.user,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      token: json['token'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }
}

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.phone,
    super.dateOfBirth,
    super.gender,
    super.profileImage,
    required super.isVerified,
    required super.role,
    required super.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      profileImage: json['profile_image'],
      isVerified: json['is_verified'] ?? false,
      role: json['role'] ?? '',
      status: json['status'] ?? '',
    );
  }

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      dateOfBirth: dateOfBirth,
      gender: gender,
      profileImage: profileImage,
      isVerified: isVerified,
      role: role,
      status: status,
    );
  }
}
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? dateOfBirth;
  final String? gender;
  final String? profileImage;
  final bool isVerified;
  final String role;
  final String status;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.profileImage,
    required this.isVerified,
    required this.role,
    required this.status,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    dateOfBirth,
    gender,
    profileImage,
    isVerified,
    role,
    status,
  ];
}
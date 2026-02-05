import 'package:equatable/equatable.dart';

class SignUpRequest extends Equatable{
  final String email;
  final String password;
  final String name;
  final String phone;
  final String date_of_birth;
  final String gender;
 const SignUpRequest({
    required this.email,
   required this.password,
   required this.name,
   required this.phone,
   required this.date_of_birth,
   required this.gender,
});
  @override
  List<Object> get props => [email, password, name, phone, date_of_birth, gender];

}
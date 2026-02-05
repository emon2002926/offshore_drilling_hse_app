import 'package:offshore_drilling_hse_app/features/auth/domain/entities/sign_up_request.dart';

class SignUpRequestModel extends SignUpRequest{


  const SignUpRequestModel({
    required super.email,
    required super.password,
    required super.name,
    required super.phone,
    required super.date_of_birth,
    required super.gender});
  Map<String ,dynamic> toJson(){
    return{

      "name":name,
      "email": email,
      "password": password,
      "phone": phone,
      "date_of_birth": "1980-04-20",
      "gender": "Male"   // enum: ["male", "female", "other"],
    };
  }
}
class LoginRequest {
  final String name;
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'email': email,
      'password': password,
      'phone': "01711121",
      'date_of_birth': '1980-04-20',
      'gender': 'Male'   // enum: ["male", "female", "other"],
    };
  }
}
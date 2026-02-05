import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';
import '../model/sign_up_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);


}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.loginEndpoint,
        data: request.toJson(),
      );

      // Success response (200)
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Login failed',
        );
      }
    } on DioException catch (e) {
      // If the server returns an error response (like 400, 401, etc.)
      // the error will have the response data with {"success": false, "message": "..."}
      // Just rethrow it to be handled in the repository layer
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<SignUpResponseModel> signUp(LoginRequestModel request) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.loginEndpoint,
        data: request.toJson(),
      );

      // Success response (200)
      if (response.statusCode == 200) {
        return SignUpResponseModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Sign up failed',
        );
      }
    } on DioException catch (e) {
      // If the server returns an error response (like 400, 401, etc.)
      // the error will have the response data with {"success": false, "message": "..."}
      // Just rethrow it to be handled in the repository layer
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }


}
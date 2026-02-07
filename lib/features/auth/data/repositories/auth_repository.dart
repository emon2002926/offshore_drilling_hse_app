import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../model/login_request.dart';
import '../model/login_response.dart';


class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  // Simple login - returns response or throws error
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.loginEndpoint,
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      // Handle API errors
      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map<String, dynamic>) {
          return LoginResponse(
            success: false,
            message: data['message'] ?? 'Login failed',
          );
        }
      }

      // Handle network errors
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('No internet connection');
      }

      throw Exception('Network error occurred');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<LoginResponse> signUp(LoginRequest request) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.loginEndpoint,
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      // Handle API errors
      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map<String, dynamic>) {
          return LoginResponse(
            success: false,
            message: data['message'] ?? 'Login failed',
          );
        }
      }

      // Handle network errors
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('No internet connection');
      }

      throw Exception('Network error occurred');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }




}
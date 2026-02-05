import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:offshore_drilling_hse_app/features/auth/domain/entities/sign_up_request.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../model/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ({User user, String token})>> login(
      LoginRequest request) async {
    // Check internet connection
    if (!await networkInfo.isConnected) {
      return const Left(
        NetworkFailure('No internet connection'),
      );
    }

    try {
      final requestModel = LoginRequestModel.fromEntity(request);
      final response = await remoteDataSource.login(requestModel);

      if (response.success) {
        return Right((
        user: response.data.user.toEntity(),
        token: response.data.token,
        ));
      } else {
        return Left(ServerFailure(response.message));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle error response in format: {"success": false, "message": "error message"}
        try {
          final responseData = e.response?.data;
          if (responseData is Map<String, dynamic>) {
            final message = responseData['message'] ?? 'Server error occurred';
            return Left(ServerFailure(message));
          }
          return const Left(ServerFailure('Server error occurred'));
        } catch (_) {
          return const Left(ServerFailure('Server error occurred'));
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Left(NetworkFailure('Connection timeout'));
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure('No internet connection'));
      } else {
        return const Left(NetworkFailure('Network error occurred'));
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, ({String token, User user})>> signUp(SignUpRequest request) async{

    // Check internet connection
    if (!await networkInfo.isConnected) {
      return const Left(
        NetworkFailure('No internet connection'),
      );
    }

    try {
      final requestModel = LoginRequestModel.fromEntity(request);
      final response = await remoteDataSource.login(requestModel);

      if (response.success) {
        return Right((
        user: response.data.user.toEntity(),
        token: response.data.token,
        ));
      } else {
        return Left(ServerFailure(response.message));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle error response in format: {"success": false, "message": "error message"}
        try {
          final responseData = e.response?.data;
          if (responseData is Map<String, dynamic>) {
            final message = responseData['message'] ?? 'Server error occurred';
            return Left(ServerFailure(message));
          }
          return const Left(ServerFailure('Server error occurred'));
        } catch (_) {
          return const Left(ServerFailure('Server error occurred'));
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Left(NetworkFailure('Connection timeout'));
      } else if (e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure('No internet connection'));
      } else {
        return const Left(NetworkFailure('Network error occurred'));
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }


  }




}
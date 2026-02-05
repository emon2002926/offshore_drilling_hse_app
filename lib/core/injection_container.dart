import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/presentation/bloc/login/login_bloc.dart';
import 'api/api_client.dart';
import 'network/network_info.dart';



final getIt = GetIt.instance;

Future<void> init() async {
  // BLoC
  getIt.registerFactory(
        () => LoginBloc(loginUseCase: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(getIt()),
  );

  // Core
  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(getIt()),
  );

  // External
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
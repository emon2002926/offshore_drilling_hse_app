import 'package:get_it/get_it.dart';
import '../features/auth/data/repositories/auth_repository.dart';
import '../features/auth/presentation/bloc/login/login_bloc.dart';
import 'api/api_client.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // BLoC
  getIt.registerFactory(() => LoginBloc(getIt()));

  // Repository
  getIt.registerLazySingleton(() => AuthRepository(getIt()));

  // Core
  getIt.registerLazySingleton(() => ApiClient());
}
import 'package:enzomir/core/common/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:enzomir/core/secrets/app_secrets.dart';
import 'package:enzomir/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:enzomir/features/auth/data/repository/auth_repository_impl.dart';
import 'package:enzomir/features/auth/domain/repository/auth_repository.dart';
import 'package:enzomir/features/auth/domain/usecases/current_user.dart';
import 'package:enzomir/features/auth/domain/usecases/user_logout.dart';
import 'package:enzomir/features/auth/domain/usecases/user_sign_in.dart';
import 'package:enzomir/features/auth/domain/usecases/user_sign_up.dart';
import 'package:enzomir/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.anonkey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  // Core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  // Data source
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    // Usecases
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserSignIn(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))
    ..registerFactory(() => UserLogout(serviceLocator()))
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignIn: serviceLocator(),
        userSignUp: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
        userLogout: serviceLocator(),
      ),
    );
}

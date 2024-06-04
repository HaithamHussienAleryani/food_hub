import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_hub/features/Auth/data/data_sources/auth_remote_data_source.dart';
import 'package:food_hub/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_google.dart';
import 'package:food_hub/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  _authInit();
  serviceLocator.registerLazySingleton(() => firebaseAuth);
}

void _authInit() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    ..registerFactory<UserSignUpViaGoogle>(() => serviceLocator())
    ..registerLazySingleton<AuthBloc>(
        () => AuthBloc(userSignUpViaGoogle: serviceLocator()));
}

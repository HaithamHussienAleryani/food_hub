import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_hub/core/common/cubits/user_cubit/user_cubit.dart';
import 'package:food_hub/core/utils/network_check.dart';
import 'package:food_hub/features/Auth/data/data_sources/auth_remote_data_source.dart';
import 'package:food_hub/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_get_session.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_login_via_email_and_password.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_out.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_email_and_password.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_google.dart';
import 'package:food_hub/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:food_hub/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:food_hub/features/home/data/repositories/home_repository_impl.dart';
import 'package:food_hub/features/home/domain/repositories/home_repository.dart';
import 'package:food_hub/features/home/domain/usecases/home_get_categories.dart';
import 'package:food_hub/features/home/domain/usecases/home_get_offers.dart';
import 'package:food_hub/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  _authInit();
  _homeInit();
  serviceLocator.registerLazySingleton(() => NetworkCheck());
  serviceLocator.registerLazySingleton(() => firebaseAuth);
  serviceLocator.registerLazySingleton(() => fireStore);
  serviceLocator.registerLazySingleton(() => UserCubit());
}

void _authInit() {
  //datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(serviceLocator(), serviceLocator()))
    //repository
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    //useCases
    ..registerFactory(() => UserSignUpViaGoogle(serviceLocator()))
    ..registerFactory(() => UserSignUpViaEmailAndPassword(serviceLocator()))
    ..registerFactory(() => UserLoginViaEmailAndPassword(serviceLocator()))
    ..registerFactory(() => UserGetSession(serviceLocator()))
    ..registerFactory(() => UserSignOut(serviceLocator()))
    ..registerLazySingleton<AuthBloc>(() => AuthBloc(
        userSignUpViaGoogle: serviceLocator(),
        userSignupUsingViaEmailAndPassword: serviceLocator(),
        userLoginViaEmailAndPassword: serviceLocator(),
        userCubit: serviceLocator(),
        userSignOut: serviceLocator(),
        userGetSession: serviceLocator()));
}

void _homeInit() {
  //datasource
  serviceLocator
    ..registerFactory<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(serviceLocator()))
    //repository
    ..registerFactory<HomeRepository>(
        () => HomeRepositoryImpl(serviceLocator()))
    //useCases
    ..registerFactory(() => HomeGetOffers(serviceLocator()))
    ..registerFactory(() => HomeGetCategories(serviceLocator()))
    ..registerLazySingleton<HomeBloc>(() => HomeBloc(
        homeOffers: serviceLocator(), homeCategories: serviceLocator()));
}

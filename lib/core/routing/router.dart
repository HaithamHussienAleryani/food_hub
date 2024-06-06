import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/core/common/cubits/user_cubit/user_cubit.dart';
import 'package:food_hub/features/Auth/presentation/pages/login_page.dart';
import 'package:food_hub/features/Auth/presentation/pages/onboarding_page.dart';
import 'package:food_hub/features/Auth/presentation/pages/sign_up_page.dart';
import 'package:food_hub/features/Auth/presentation/pages/splash_page.dart';
import 'package:food_hub/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final routingConfiguration =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, _) => const SplashPage(),
  ),
  GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, _) => BlocSelector<UserCubit, UserState, bool>(
            selector: (state) {
              debugPrint("The user cubit state is ${state.runtimeType}");
              return state is UserIsLoggedIn;
            },
            builder: (context, isLoggedIn) {
              if (isLoggedIn) {
                return const HomePage();
              }
              return const OnBoardingPage();
            },
          ),
      routes: [
        GoRoute(
            path: 'signup',
            name: 'signup',
            builder: (context, _) => const SignUpPage(),
            routes: [
              GoRoute(
                path: 'login',
                name: 'loginSignUp',
                builder: (context, _) => const LoginPage(),
              ),
            ]),
        GoRoute(
          path: 'login',
          name: 'loginOnBoard',
          builder: (context, _) => const LoginPage(),
        ),
      ]),
  GoRoute(
      path: '/home', name: 'home', builder: (context, _) => const HomePage()),
]);

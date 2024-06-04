import 'package:food_hub/features/Auth/presentation/pages/login_page.dart';
import 'package:food_hub/features/Auth/presentation/pages/onboarding_page.dart';
import 'package:food_hub/features/Auth/presentation/pages/sign_up_page.dart';
import 'package:food_hub/features/Auth/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final routingConfiguration =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, _) => const SplashPage()),
  GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, _) => const OnBoardingPage(),
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
]);

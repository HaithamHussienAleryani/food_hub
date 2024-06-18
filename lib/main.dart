import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/cubits/user_cubit/user_cubit.dart';
import 'package:food_hub/core/routing/router.dart';
import 'package:food_hub/core/theme/theme.dart';
import 'package:food_hub/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:food_hub/firebase_options.dart';
import 'package:food_hub/init_dependencies.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as map;
import 'package:mapbox_search/mapbox_search.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependencies();

  await dotenv.load(fileName: ".env");

  MapBoxSearch.init(dotenv.env['MAP_BOX_TOKEN']!);
  map.MapboxOptions.setAccessToken(dotenv.env['MAP_BOX_TOKEN']!);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => serviceLocator<UserCubit>(),
    ),
    BlocProvider(create: (_) => serviceLocator<AuthBloc>())
  ], child: const FoodHub()));
}

class FoodHub extends StatelessWidget {
  const FoodHub({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: ToastificationWrapper(
        child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ar')],
          title: 'FoodHub',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeMode,
          routerConfig: routingConfiguration,
        ),
      ),
    );
  }
}

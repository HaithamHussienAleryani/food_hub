import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/routing/router.dart';
import 'package:food_hub/core/theme/theme.dart';
import 'package:food_hub/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FoodHub());
}

class FoodHub extends StatelessWidget {
  const FoodHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        title: 'FoodHub',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        routerConfig: routingConfiguration,
      ),
    );
  }
}

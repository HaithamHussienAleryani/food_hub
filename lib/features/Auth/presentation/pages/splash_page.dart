import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/constants/images/images-constants.dart';
import 'package:food_hub/core/common/widgets/vertical-space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed('onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 93,
              height: 93,
              padding: const EdgeInsets.all(19),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppPallet.primary.withOpacity(0.5),
                      blurRadius: 35,
                      offset: const Offset(0, 30),
                    )
                  ],
                  color: AppPallet.whiteColor,
                  borderRadius: BorderRadius.circular(24)),
              child: SvgPicture.asset(
                appLogo,
                width: 47.19,
                height: 49.72,
              ),
            ),
            const VerticalSpace(space: 10),
            SizedBox(child: SvgPicture.asset(appLogoName)),
          ],
        ),
      ),
    );
  }
}

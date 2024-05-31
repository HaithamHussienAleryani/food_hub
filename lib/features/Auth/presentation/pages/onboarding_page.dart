import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/images/images-constants.dart';
import 'package:food_hub/core/common/widgets/vertical-space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/features/Auth/presentation/widgets/already_have_acount_button.dart';
import 'package:food_hub/features/Auth/presentation/widgets/login_with_email_button.dart';
import 'package:food_hub/features/Auth/presentation/widgets/onboarding_greeting.dart';
import 'package:food_hub/features/Auth/presentation/widgets/onboarding_subtitle.dart';
import 'package:food_hub/features/Auth/presentation/widgets/sign_in_title.dart';
import 'package:food_hub/features/Auth/presentation/widgets/social_media_buttons.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onBoardingImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: AppPallet.onboardingGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(space: 160.h),
                const OnboardingGreeting(),
                VerticalSpace(space: 10.h),
                const OnboardingSubtitle(),
                VerticalSpace(space: 190.h),
                const SignInTitle(),
                VerticalSpace(space: 18.h),
                const SocialMediaButtons(),
                VerticalSpace(space: 23.h),
                const LoginWithEmailButton(),
                VerticalSpace(space: 25.h),
                const AlreadyHaveAccountButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

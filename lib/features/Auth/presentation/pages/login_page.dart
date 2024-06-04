import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/vertical-space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:food_hub/features/Auth/presentation/widgets/auth_bubble.dart';
import 'package:food_hub/features/Auth/presentation/widgets/auth_button.dart';
import 'package:food_hub/features/Auth/presentation/widgets/auth_input.dart';
import 'package:food_hub/features/Auth/presentation/widgets/dont_have_account.dart';
import 'package:food_hub/features/Auth/presentation/widgets/social_media_sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const AuthBubble(),
            VerticalSpace(space: 23.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTranslation(context).onlySignIn,
                    style:
                        TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
                  ),
                  Form(
                      child: Column(
                    children: [
                      const AuthInput(
                        title: "Email",
                        inputType: TextInputType.emailAddress,
                      ),
                      const AuthInput(
                        title: "Password",
                      ),
                      VerticalSpace(space: 31.h),
                      AuthButton(
                        title:
                            AppLocalizations.of(context)!.signUp.toUpperCase(),
                        onTap: () {},
                      ),
                      VerticalSpace(space: 31.h),
                      const DoNotHaveAccount(),
                      VerticalSpace(space: 31.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppPallet.borderColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              getTranslation(context).signIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppPallet.borderColor,
                            ),
                          ),
                        ],
                      ),
                      VerticalSpace(space: 31.h),
                      SocialSignUp(
                        onTap: () {},
                      ),
                      VerticalSpace(space: 31.h),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

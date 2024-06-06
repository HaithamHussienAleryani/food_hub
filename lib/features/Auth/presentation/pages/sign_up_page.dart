import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/vertical-space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:food_hub/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:food_hub/features/Auth/presentation/widgets/already_have_account_sign_up.dart';
import 'package:food_hub/features/Auth/presentation/widgets/auth_bubble.dart';
import 'package:food_hub/features/Auth/presentation/widgets/auth_button.dart';
import 'package:food_hub/features/Auth/presentation/widgets/auth_input.dart';
import 'package:food_hub/features/Auth/presentation/widgets/social_media_sign_up.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  final key = GlobalKey<FormState>();

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
                    AppLocalizations.of(context)!.signUp,
                    style:
                        TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
                  ),
                  Form(
                      key: key,
                      child: Column(
                        children: [
                          AuthInput(
                            controller: name,
                            title: "Full name",
                          ),
                          AuthInput(
                            controller: email,
                            title: "Email",
                            inputType: TextInputType.emailAddress,
                          ),
                          AuthInput(
                            controller: password,
                            title: "Password",
                            isObSecure: true,
                          ),
                          VerticalSpace(space: 31.h),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is AuthFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(state.error),
                                        backgroundColor: AppPallet.primary));
                              }
                            },
                            builder: (context, state) {
                              return AuthButton(
                                title: AppLocalizations.of(context)!
                                    .signUp
                                    .toUpperCase(),
                                state: state,
                                onTap: () {
                                  if (!key.currentState!.validate()) return;

                                  context.read<AuthBloc>().add(
                                      AuthSignUpViaEmailAndPassword(
                                          email: email.text,
                                          password: password.text));
                                },
                              );
                            },
                          ),
                          VerticalSpace(space: 31.h),
                          const AlreadyHaveAccountSignUp(),
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
                                  getTranslation(context).signUpWith,
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
                          const SocialSignUp(),
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

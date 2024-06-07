import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccountButton extends StatelessWidget {
  const AlreadyHaveAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: AppLocalizations.of(context)!.alreadyHaveAccount,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                fontFamily: 'Sofia',
                color: Colors.white),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.goNamed('loginOnBoard');
                  },
                text: AppLocalizations.of(context)!.onlySignIn,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppPallet.whiteColor,
                ),
              )
            ]),
      ),
    );
  }
}

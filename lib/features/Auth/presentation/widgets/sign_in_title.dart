import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppPallet.whiteColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            AppLocalizations.of(context)!.signIn,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppPallet.whiteColor,
                fontSize: 16.sp,
                fontFamily: 'Sofia',
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppPallet.whiteColor,
          ),
        ),
      ],
    );
  }
}

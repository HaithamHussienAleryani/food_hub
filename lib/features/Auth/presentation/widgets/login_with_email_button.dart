import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class LoginWithEmailButton extends StatelessWidget {
  const LoginWithEmailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
          color: AppPallet.whiteColor.withOpacity(0.21),
          borderRadius: BorderRadius.circular(27),
          border: Border.all(color: AppPallet.whiteColor, width: 1)),
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.startWithEmail,
          style: TextStyle(
              fontSize: 17.sp,
              color: AppPallet.whiteColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'Sofia'),
        ),
      ),
    );
  }
}

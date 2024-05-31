import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class OnboardingSubtitle extends StatelessWidget {
  const OnboardingSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 0.5.sw,
        child: Text(
          AppLocalizations.of(context)!.onboardingSubtitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppPallet.onboardingSubtitleColor, fontFamily: 'Sofia'),
        ));
  }
}

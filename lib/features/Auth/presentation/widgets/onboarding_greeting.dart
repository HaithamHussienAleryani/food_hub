import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class OnboardingGreeting extends StatelessWidget {
  const OnboardingGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: AppLocalizations.of(context)!.helloWorld,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 50,
              fontWeight: FontWeight.w800,
              fontFamily: 'Sofia',
              color: Colors.black),
          children: [
            TextSpan(
                text: "\n${AppLocalizations.of(context)!.appName}",
                style: const TextStyle(color: AppPallet.primary))
          ]),
    );
  }
}

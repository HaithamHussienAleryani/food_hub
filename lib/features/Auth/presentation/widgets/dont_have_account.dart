import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:go_router/go_router.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: getTranslation(context).doNotHaveAccount,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pop();
                  },
                text: getTranslation(context).signUp,
                style: const TextStyle(
                  color: AppPallet.primary,
                ),
              )
            ]),
      ),
    );
  }
}

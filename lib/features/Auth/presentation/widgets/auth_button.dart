import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? width;
  const AuthButton(
      {super.key, required this.onTap, required this.title, this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(10),
            shadowColor:
                WidgetStatePropertyAll(AppPallet.shadowColor.withOpacity(0.26)),
            backgroundColor: const WidgetStatePropertyAll(AppPallet.primary),
            fixedSize: WidgetStatePropertyAll(Size(width ?? 248.w, 60.h))),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 15.sp, letterSpacing: 1, color: AppPallet.whiteColor),
        ));
  }
}

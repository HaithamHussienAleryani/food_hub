import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class AuthBubble extends StatelessWidget {
  const AuthBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.1.sh,
      child: Stack(
        children: [
          PositionedDirectional(
            start: -46.w,
            top: -21.h,
            child: Container(
              height: 96.h,
              width: 96.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppPallet.primary,
              ),
            ),
          ),
          PositionedDirectional(
            start: -5.w,
            top: -99.h,
            child: Container(
              height: 165.h,
              width: 165.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppPallet.primaryLight,
              ),
            ),
          ),
          PositionedDirectional(
            start: 298.w,
            top: -109.h,
            child: Container(
              height: 181.h,
              width: 181.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppPallet.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

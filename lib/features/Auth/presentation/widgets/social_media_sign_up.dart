import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/constants/images/images-constants.dart';
import 'package:food_hub/core/common/widgets/horizontal-space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';

class SocialSignUp extends StatelessWidget {
  final VoidCallback onTap;
  const SocialSignUp({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: AppPallet.whiteColor,
            border: Border.all(color: AppPallet.primary, width: 0.5),
            borderRadius: BorderRadius.circular(27)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              google,
              height: 30.h,
              width: 30.h,
            ),
            HorizontalSpace(space: 10.w),
            Text(
              getTranslation(context).google.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

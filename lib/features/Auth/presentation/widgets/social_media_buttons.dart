import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/constants/images/images-constants.dart';
import 'package:food_hub/core/common/widgets/horizontal-space.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
        //       decoration: BoxDecoration(
        //           color: AppPallet.whiteColor,
        //           borderRadius: BorderRadius.circular(27)),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(
        //             facebook,
        //           ),
        //           HorizontalSpace(space: 10.w),
        //           Text(
        //             AppLocalizations.of(context)!.facebook.toUpperCase(),
        //             style: TextStyle(
        //               fontFamily: 'Sofia',
        //               fontWeight: FontWeight.w500,
        //               fontSize: 13.sp,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // HorizontalSpace(space: 40.w),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppPallet.whiteColor,
                  borderRadius: BorderRadius.circular(27)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(google),
                  HorizontalSpace(space: 10.w),
                  Text(
                    AppLocalizations.of(context)!.google.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Sofia',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

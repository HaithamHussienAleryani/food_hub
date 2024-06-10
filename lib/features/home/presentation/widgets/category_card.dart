import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class CategoryCard extends StatelessWidget {
  final String icon, title;
  final bool isActive;
  const CategoryCard({
    super.key,
    required this.icon,
    this.isActive = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: SizedBox(
        height: 130.h,
        child: Card(
          elevation: 10,
          color: isActive ? AppPallet.primary : AppPallet.whiteColor,
          shadowColor: AppPallet.shadowColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(7.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppPallet.primary),
                      color: AppPallet.whiteColor,
                    ),
                    child: SvgPicture.asset(icon,
                        height: 32.h,
                        width: 32.h,
                        colorFilter: const ColorFilter.mode(
                            AppPallet.primary, BlendMode.srcIn)),
                  ),
                ),
                VerticalSpace(space: 10.h),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: isActive ? AppPallet.whiteColor : Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

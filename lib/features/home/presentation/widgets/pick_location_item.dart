import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class PickLocationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const PickLocationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: AppPallet.borderColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20.sp,
              ),
              HorizontalSpace(space: 5.w),
              Text(
                title,
                style: TextStyle(fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

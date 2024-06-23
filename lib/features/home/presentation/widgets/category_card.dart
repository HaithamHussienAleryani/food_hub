import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/features/home/data/models/CategoryModel.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final bool isActive;
  const CategoryCard({
    super.key,
    this.isActive = false,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Card(
        elevation: 10,
        color: isActive ? AppPallet.primary : AppPallet.whiteColor,
        shadowColor: AppPallet.shadowColor.withOpacity(0.5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
        child: Padding(
          padding: EdgeInsets.only(bottom: 13.h, top: 3.h),
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
                  child: SvgPicture.network(categoryModel.image!,
                      height: 32.h,
                      width: 32.h,
                      colorFilter: const ColorFilter.mode(
                          AppPallet.primary, BlendMode.srcIn)),
                ),
              ),
              VerticalSpace(space: 10.h),
              Text(
                categoryModel.name!,
                style: TextStyle(
                    fontSize: 11.sp,
                    color: isActive ? AppPallet.whiteColor : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

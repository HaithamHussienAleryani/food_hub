import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class FeaturedRestaurantCard extends StatelessWidget {
  const FeaturedRestaurantCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 18.w),
        decoration: BoxDecoration(
            color: AppPallet.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFe9e9e9).withOpacity(0.5),
                offset: const Offset(-8, 10),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ]),
        width: 240.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(15.r),
                      topEnd: Radius.circular(15.r)),
                  child: Image.asset(
                    mealOne,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 9.w, vertical: 11.h),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: AppPallet.whiteColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                        HorizontalSpace(space: 4.w),
                        Icon(
                          Icons.star,
                          size: 15.sp,
                          color: AppPallet.shadowColorYellow,
                        ),
                      ],
                    ),
                  ),
                ),
                PositionedDirectional(
                  end: 0,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.w, vertical: 11.h),
                    child: CircleAvatar(
                      backgroundColor: AppPallet.whiteColor,
                      radius: 20.r,
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: AppPallet.primary,
                        size: 17.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
            VerticalSpace(space: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "McDonald's",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  VerticalSpace(space: 6.h),
                  Row(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.motorcycle_rounded,
                              size: 14.w,
                              color: AppPallet.primary,
                            ),
                            HorizontalSpace(space: 6.w),
                            Text(
                              'Free delivery',
                              style: TextStyle(
                                  color: AppPallet.inputTitle,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12.sp),
                            )
                          ],
                        ),
                      ),
                      HorizontalSpace(space: 20.w),
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 14.w,
                              color: AppPallet.primary,
                            ),
                            HorizontalSpace(space: 6.w),
                            Text(
                              '10-15 min',
                              style: TextStyle(
                                  color: AppPallet.inputTitle, fontSize: 12.sp),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 9.w,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppPallet.inputColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 6.h),
                          child: Text(
                            'Burger',
                            style: TextStyle(
                                fontSize: 12.sp, color: AppPallet.inputTitle),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppPallet.inputColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 6.h),
                          child: Text(
                            'Burger',
                            style: TextStyle(
                                fontSize: 12.sp, color: AppPallet.inputTitle),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

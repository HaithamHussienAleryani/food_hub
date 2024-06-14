import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/animations/animation_constant.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:lottie/lottie.dart';

class RestaurantsNearby extends StatefulWidget {
  const RestaurantsNearby({super.key});

  @override
  State<RestaurantsNearby> createState() => _RestaurantsNearbyState();
}

class _RestaurantsNearbyState extends State<RestaurantsNearby> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 1.sw,
        child: Card(
          elevation: 0,
          color: AppPallet.primaryLight,
          shape: RoundedRectangleBorder(
              // side: const BorderSide(color: AppPallet.primary),
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Opacity(
                  opacity: 0.8,
                  child: SizedBox(
                      height: 150.w,
                      width: 150.w,
                      child: Lottie.asset(
                        locationAnimation,
                      )),
                ),
              ),
              SizedBox(
                height: 150.w,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        VerticalSpace(space: 10.h),
                        SizedBox(
                          width: 0.6.sw,
                          child: Text(
                            getTranslation(context).starving,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        VerticalSpace(space: 10.h),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: const WidgetStatePropertyAll(0),
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 5.sp, vertical: 0)),
                              minimumSize:
                                  WidgetStatePropertyAll(Size(100.w, 40.h)),
                              fixedSize:
                                  WidgetStatePropertyAll(Size(100.w, 20.h)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r))),
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppPallet.whiteColor)),
                          child: Text(
                            getTranslation(context).browseAll,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: AppPallet.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

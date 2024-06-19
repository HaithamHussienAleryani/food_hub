import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/animations/animation_constant.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:food_hub/features/home/presentation/widgets/appbar.dart';
import 'package:food_hub/features/home/presentation/widgets/featured_restaurants.dart';
import 'package:food_hub/features/home/presentation/widgets/home_categories.dart';
import 'package:food_hub/features/home/presentation/widgets/home_offers.dart';
import 'package:food_hub/features/home/presentation/widgets/home_search.dart';
import 'package:food_hub/features/home/presentation/widgets/pupular_food.dart';
import 'package:food_hub/features/home/presentation/widgets/restaurants_nearby.dart';
import 'package:lottie/lottie.dart';

class HomeWidget extends StatefulWidget {
  final Duration duration;
  final double screenWidth;
  final bool isCollapsed;
  final VoidCallback onTap;
  final Animation<double> scaleAnimation;
  final AnimationController controller;
  const HomeWidget(
      {super.key,
      required this.duration,
      required this.screenWidth,
      required this.isCollapsed,
      required this.scaleAnimation,
      required this.controller,
      required this.onTap});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : 0.6 * widget.screenWidth,
      right: widget.isCollapsed ? 0 : -0.2 * widget.screenWidth,
      child: ScaleTransition(
        scale: widget.scaleAnimation,
        child: Material(
          animationDuration: widget.duration,
          color: AppPallet.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(widget.isCollapsed ? 0 : 25.r),
          elevation: 20,
          shadowColor: AppPallet.shadowColor.withOpacity(0.2),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: !widget.isCollapsed
                ? const NeverScrollableScrollPhysics()
                : const ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(top: 48.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Appbar(
                      isCollapsed: widget.isCollapsed,
                      controller: widget.controller,
                      onTap: widget.onTap,
                    ),
                  ),
                  VerticalSpace(space: 32.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 0.70.sw,
                      child: Text(
                        getTranslation(context).whatWouldYouLikeToOrder,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  VerticalSpace(space: 19.h),
                  const HomeSearch(),
                  VerticalSpace(space: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 0.70.sw,
                      child: Row(
                        children: [
                          Text(
                            getTranslation(context).offersOfTheDay,
                            style: TextStyle(
                                height: 1.7.h,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900),
                          ),
                          HorizontalSpace(space: 10.w),
                          Lottie.asset(offerAnimation,
                              repeat: true, reverse: true),
                        ],
                      ),
                    ),
                  ),
                  VerticalSpace(space: 19.h),
                  HomeOffers(widget: widget),
                  VerticalSpace(space: 20.h),
                  HomeCategories(widget: widget),
                  const RestaurantsNearby(),
                  VerticalSpace(space: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getTranslation(context).featuredRestaurants,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          getTranslation(context).viewAll,
                          style: TextStyle(
                              fontSize: 13.sp, color: AppPallet.primary),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(space: 15.h),
                  const FeaturedRestaurants(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getTranslation(context).popularItems,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          getTranslation(context).viewAll,
                          style: TextStyle(
                              fontSize: 13.sp, color: AppPallet.primary),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(space: 15.h),
                  const PopularFood(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

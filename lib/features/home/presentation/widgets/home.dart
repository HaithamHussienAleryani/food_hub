import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/features/home/presentation/widgets/appbar.dart';
import 'package:food_hub/features/home/presentation/widgets/category_card.dart';
import 'package:food_hub/features/home/presentation/widgets/featured_restaurant_card.dart';
import 'package:food_hub/features/home/presentation/widgets/meal_card.dart';

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
          borderRadius: BorderRadius.circular(widget.isCollapsed ? 0 : 25),
          elevation: 20,
          shadowColor: AppPallet.shadowColor.withOpacity(0.2),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(top: 48),
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
                        "What would you like to order",
                        style: TextStyle(
                            height: 1.7.h,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  VerticalSpace(space: 19.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: AppPallet.inputColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 25.sp,
                            color: AppPallet.inputHint,
                          ),
                          HorizontalSpace(space: 5.w),
                          Text(
                            'Find food or restaurants..',
                            style: TextStyle(
                                fontSize: 13.sp, color: AppPallet.inputHint),
                          )
                        ],
                      ),
                    ),
                  ),
                  VerticalSpace(space: 20.h),
                  SizedBox(
                    height: 145.h,
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategoryCard(
                            icon: burger,
                            isActive: true,
                            title: 'Burger',
                          ),
                          CategoryCard(
                            icon: burger,
                            title: 'Donat',
                          ),
                          CategoryCard(
                            icon: burger,
                            title: 'Pizza',
                          ),
                          CategoryCard(
                            icon: burger,
                            title: 'Mexican',
                          ),
                          CategoryCard(
                            icon: burger,
                            title: 'Asian',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Featured Restaurants',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(
                              fontSize: 13.sp, color: AppPallet.primary),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(space: 15.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 310.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FeaturedRestaurantCard(),
                          const FeaturedRestaurantCard(),
                          const FeaturedRestaurantCard(),
                          HorizontalSpace(space: 16.w),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Popular items',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(
                              fontSize: 13.sp, color: AppPallet.primary),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(space: 15.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 300.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MealCard(),
                          const MealCard(),
                          const MealCard(),
                          HorizontalSpace(space: 16.w),
                        ],
                      ),
                    ),
                  ),
                  VerticalSpace(space: 0.05.sh),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

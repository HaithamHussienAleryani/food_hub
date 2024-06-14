import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/features/home/presentation/widgets/drawer_list_item.dart';

class AnimatedDrawer extends StatefulWidget {
  final Animation<double> menuScaleAnimation;
  final Animation<Offset> slideAnimation;
  const AnimatedDrawer(
      {super.key,
      required this.menuScaleAnimation,
      required this.slideAnimation});

  @override
  State<AnimatedDrawer> createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.slideAnimation,
      child: ScaleTransition(
        scale: widget.menuScaleAnimation,
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 10.h, bottom: 10.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  VerticalSpace(space: 43.h),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          foregroundImage: const AssetImage(
                            userPlaceHolder,
                          ),
                          radius: 45.h,
                        ),
                        VerticalSpace(space: 21.h),
                        Text(
                          "Haitham Hussien",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                        VerticalSpace(space: 2.h),
                        Text(
                          "haitham@gmail.com",
                          style: TextStyle(
                              fontSize: 13.sp, color: AppPallet.textLightColor),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(space: 43.h),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DrawerListItem(
                          icon: document,
                          title: 'My Orders',
                          onTap: () {},
                        ),
                        DrawerListItem(
                          icon: profile,
                          title: 'My Profile',
                          onTap: () {},
                        ),
                        DrawerListItem(
                          icon: location,
                          title: 'Delivery Address',
                          onTap: () {},
                        ),
                        DrawerListItem(
                          icon: message,
                          title: 'Contact Us',
                          onTap: () {},
                        ),
                        DrawerListItem(
                          icon: settings,
                          title: 'Settings',
                          onTap: () {},
                        ),
                        DrawerListItem(
                          icon: helps,
                          title: 'Helps & FAQs',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(space: 20.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(10),
                      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                          vertical: 2.h, horizontal: 12.w)),
                      shadowColor: WidgetStatePropertyAll(
                          AppPallet.shadowColor.withOpacity(0.26)),
                      backgroundColor:
                          const WidgetStatePropertyAll(AppPallet.primary),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.power_settings_new,
                          color: AppPallet.whiteColor,
                          size: 20.sp,
                        ),
                        HorizontalSpace(space: 9.w),
                        Text(
                          "Log Out",
                          style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              color: AppPallet.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:food_hub/features/home/presentation/widgets/pick_location_bottomsheet.dart';

class Appbar extends StatefulWidget {
  final AnimationController controller;
  final VoidCallback onTap;
  final bool isCollapsed;
  const Appbar(
      {super.key,
      required this.controller,
      required this.onTap,
      required this.isCollapsed});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
            overlayColor: WidgetStateColor.transparent,
            onTap: widget.onTap,
            child: Card(
              elevation: 10,
              color: AppPallet.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)),
              shadowColor: AppPallet.shadowColor.withOpacity(0.3),
              child: SizedBox(
                  height: 38.w,
                  width: 38.w,
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: SvgPicture.asset(menuDrawer),
                  )),
            )),
        AnimatedScale(
          scale: widget.isCollapsed ? 1 : 0.7,
          duration: const Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const PickLocationBottomSheet()),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      getTranslation(context).deliverTo,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppPallet.textLightColor,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 25.w,
                      color: AppPallet.textLightColor,
                    ),
                  ],
                ),
                Text(
                  getTranslation(context).choosePlaceToDeliver,
                  style: TextStyle(fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 10,
          color: AppPallet.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          shadowColor: AppPallet.shadowColorYellow.withOpacity(0.3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: SizedBox(
                height: 38.w,
                width: 38.w,
                child: Image.asset(
                  userPlaceHolder,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ],
    );
  }
}

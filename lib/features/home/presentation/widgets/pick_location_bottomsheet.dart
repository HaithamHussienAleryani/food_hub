import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/form_input.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:food_hub/features/home/presentation/widgets/pick_location_item.dart';

class PickLocationBottomSheet extends StatelessWidget {
  const PickLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey formKey = GlobalKey<FormState>();
    return Container(
      height: 0.9.sh,
      width: 1.sw,
      decoration: const BoxDecoration(color: AppPallet.whiteColor),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(space: 5.h),
              Stack(
                children: [
                  Center(
                    child: Text(
                      "Enter your location",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  PositionedDirectional(
                    end: 0,
                    child: InkWell(
                        overlayColor: WidgetStateColor.transparent,
                        onTap: () => {},
                        child: Text(
                          "cancel",
                          style: TextStyle(
                              color: AppPallet.primary, fontSize: 13.sp),
                        )),
                  ),
                ],
              ),
              VerticalSpace(space: 15.h),
              Form(
                key: formKey,
                child: FormInput(
                  title: getTranslation(context).addressName,
                  hideTitle: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PickLocationItem(
                    icon: Icons.location_searching,
                    title: "Use current location",
                    onTap: () {},
                  ),
                  HorizontalSpace(space: 10.w),
                  PickLocationItem(
                    icon: Icons.location_on_outlined,
                    title: "Pick another location",
                    onTap: () {},
                  ),
                ],
              ),
              VerticalSpace(space: 25.h),
              Text(
                "My locations",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
                selected: true,
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
              ),
              const MyLocationItem(
                name: "Location name",
                location: "Some random value",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLocationItem extends StatelessWidget {
  final bool selected;
  final String name, location;
  const MyLocationItem({
    super.key,
    this.selected = false,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
      horizontalTitleGap: 10.w,
      subtitle: Text(
        location,
        style: TextStyle(fontSize: 12.sp),
      ),
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.location_on,
        size: 25.sp,
        color: !selected ? Colors.black : AppPallet.primary,
      ),
    );
  }
}

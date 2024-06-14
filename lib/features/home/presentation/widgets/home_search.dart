import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: AppPallet.inputColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 25.sp,
              color: AppPallet.inputHint,
            ),
            HorizontalSpace(space: 5.w),
            Text(
              getTranslation(context).findFoodOrRestaurants,
              style: TextStyle(fontSize: 13.sp, color: AppPallet.inputHint),
            )
          ],
        ),
      ),
    );
  }
}

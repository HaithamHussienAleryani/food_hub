
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/features/home/presentation/widgets/meal_card.dart';

class PopularFood extends StatelessWidget {
  const PopularFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/features/home/presentation/widgets/featured_restaurant_card.dart';

class FeaturedRestaurants extends StatelessWidget {
  const FeaturedRestaurants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FeaturedRestaurantCard(),
          const FeaturedRestaurantCard(),
          const FeaturedRestaurantCard(),
          HorizontalSpace(space: 16.w),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/features/home/presentation/widgets/category_card.dart';
import 'package:food_hub/features/home/presentation/widgets/home.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.widget,
  });

  final HomeWidget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: !widget.isCollapsed
            ? const NeverScrollableScrollPhysics()
            : const ClampingScrollPhysics(),
        child: const Row(
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
    );
  }
}

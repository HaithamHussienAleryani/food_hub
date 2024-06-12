import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class OfferCard extends StatelessWidget {
  final String offer;
  const OfferCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                  image: AssetImage(offer),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter)),
          child: const Banner(
            message: '50% OFF',
            location: BannerLocation.topEnd,
            color: AppPallet.primary,
          ),
        );
      },
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/features/home/presentation/widgets/home.dart';
import 'package:food_hub/features/home/presentation/widgets/offer_card.dart';

class HomeOffers extends StatelessWidget {
  const HomeOffers({
    super.key,
    required this.widget,
  });

  final HomeWidget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: CarouselSlider(
          options: CarouselOptions(
              height: 400.0,
              autoPlay: widget.isCollapsed,
              enlargeCenterPage: true,
              disableCenter: true,
              animateToClosest: true),
          items: const [
            OfferCard(
              offer: offerOne,
            ),
            OfferCard(
              offer: offerTwo,
            ),
            OfferCard(
              offer: offerThree,
            ),
          ]),
    );
  }
}

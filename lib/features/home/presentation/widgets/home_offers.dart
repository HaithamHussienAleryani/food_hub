import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/features/home/presentation/bloc/home_bloc.dart';
import 'package:food_hub/features/home/presentation/widgets/offer_card.dart';

class HomeOffers extends StatefulWidget {
  const HomeOffers({
    super.key,
    required this.isCollapsed,
  });

  final bool isCollapsed;

  @override
  State<HomeOffers> createState() => _HomeOffersState();
}

class _HomeOffersState extends State<HomeOffers> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeGetOffersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Home offers rebuilds");
    return SizedBox(
      height: 200.h,
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeGetOffersSuccess && previous != current,
        builder: (context, state) {
          return CarouselSlider(
              options: CarouselOptions(
                  height: 400.0,
                  autoPlay: widget.isCollapsed,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  animateToClosest: true),
              items: state is HomeGetOffersSuccess
                  ? state.offers
                      .map((offer) => OfferCard(offer: offer))
                      .toList()
                  : []);
        },
      ),
    );
  }
}

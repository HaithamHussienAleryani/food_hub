import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/features/home/presentation/bloc/home_bloc.dart';
import 'package:food_hub/features/home/presentation/widgets/category_card.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({
    super.key,
    required this.isCollapsed,
  });

  final bool isCollapsed;

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeGetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: !widget.isCollapsed
            ? const NeverScrollableScrollPhysics()
            : const ClampingScrollPhysics(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state is HomeGetCategoriesSuccess
                  ? state.categories
                      .map((category) => CategoryCard(
                            categoryModel: category,
                          ))
                      .toList()
                  : [],
            );
          },
        ),
      ),
    );
  }
}

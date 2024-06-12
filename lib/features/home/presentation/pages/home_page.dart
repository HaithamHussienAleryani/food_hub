import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/features/home/presentation/widgets/bottom_navigation_item.dart';
import 'package:food_hub/features/home/presentation/widgets/drawer.dart';
import 'package:food_hub/features/home/presentation/widgets/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;

  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: AppPallet.scaffoldBackgroundColor,
      bottomNavigationBar: SizedBox(
        height: 74.h,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          enableFeedback: false,
          backgroundColor: AppPallet.scaffoldBackgroundColor,
          showUnselectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          iconSize: 27.sp,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          unselectedItemColor: AppPallet.inputHint,
          selectedItemColor: AppPallet.primary,
          type: BottomNavigationBarType.fixed,
          items: [
            getBottomNavItem(Icons.home_filled, 0),
            getBottomNavItem(Icons.location_pin, 0),
            getBottomNavItem(Icons.shopping_bag_rounded, 2),
            getBottomNavItem(Icons.favorite, 0),
            getBottomNavItem(Icons.notifications_rounded, 6)
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedDrawer(
              menuScaleAnimation: _menuScaleAnimation,
              slideAnimation: _slideAnimation),
          HomeWidget(
            duration: duration,
            screenWidth: screenWidth ?? 0,
            onTap: () {
              setState(() {
                if (isCollapsed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }

                isCollapsed = !isCollapsed;
              });
            },
            isCollapsed: isCollapsed,
            scaleAnimation: _scaleAnimation,
            controller: _controller,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey.shade50,
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

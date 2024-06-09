import 'package:flutter/material.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/features/home/presentation/widgets/appbar.dart';

class HomeWidget extends StatefulWidget {
  final Duration duration;
  final double screenWidth;
  final bool isCollapsed;
  final VoidCallback onTap;
  final Animation<double> scaleAnimation;
  final AnimationController controller;
  const HomeWidget(
      {super.key,
      required this.duration,
      required this.screenWidth,
      required this.isCollapsed,
      required this.scaleAnimation,
      required this.controller,
      required this.onTap});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.controller.animationBehavior.toString());
    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : 0.6 * widget.screenWidth,
      right: widget.isCollapsed ? 0 : -0.2 * widget.screenWidth,
      child: ScaleTransition(
        scale: widget.scaleAnimation,
        child: Material(
          animationDuration: widget.duration,
          color: AppPallet.whiteColor,
          borderRadius: BorderRadius.circular(widget.isCollapsed ? 0 : 25),
          elevation: 20,
          shadowColor: AppPallet.shadowColor.withOpacity(0.2),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Appbar(
                    isCollapsed: widget.isCollapsed,
                    controller: widget.controller,
                    onTap: widget.onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  final Duration duration;
  final double screenWidth;
  bool isCollapsed;
  final Animation<double> scaleAnimation;
  final AnimationController controller;
  HomeWidget(
      {super.key,
      required this.duration,
      required this.screenWidth,
      required this.isCollapsed,
      required this.scaleAnimation,
      required this.controller});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : 0.4 * widget.screenWidth,
      right: widget.isCollapsed ? 0 : -0.2 * widget.screenWidth,
      child: ScaleTransition(
        scale: widget.scaleAnimation,
        child: Material(
          animationDuration: widget.duration,
          borderRadius: BorderRadius.circular(widget.isCollapsed ? 0 : 10),
          elevation: 8,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: const Icon(Icons.menu, color: Colors.black),
                        onTap: () {
                          setState(() {
                            if (widget.isCollapsed) {
                              widget.controller.forward();
                            } else {
                              widget.controller.reverse();
                            }

                            widget.isCollapsed = !widget.isCollapsed;
                          });
                        },
                      ),
                      const Text("My Cards",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      const Icon(Icons.settings, color: Colors.white),
                    ],
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

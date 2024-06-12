import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BottomNavigationBarItem getBottomNavItem(IconData icons, int count) =>
    BottomNavigationBarItem(
        backgroundColor: Colors.red,
        icon: Badge(
          isLabelVisible: count > 0,
          offset: Offset(7.w, -12.h),
          backgroundColor: Color(0xffFFC529),
          alignment: Alignment.topRight,
          label: Text(count.toString()),
          child: Icon(
            icons,
          ),
        ),
        label: 'home');

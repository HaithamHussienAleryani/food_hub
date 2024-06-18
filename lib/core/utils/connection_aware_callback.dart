import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/network_check.dart';
import 'package:food_hub/init_dependencies.dart';
import 'package:toastification/toastification.dart';

Future<dynamic> connectionAwareCallback(Future<dynamic> Function() func) async {
  serviceLocator<NetworkCheck>().checkInternet((bool hasInternet) async {
    debugPrint("has internet $hasInternet");
    if (hasInternet) {
      return await func();
    } else {
      toastification.show(
        type: ToastificationType.success,
        style: ToastificationStyle.flat,
        autoCloseDuration: const Duration(seconds: 10),
        title: Text(
          'connection error ',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        // you can also use RichText widget for title and description parameters
        description: Text(
          'please make sure you are connected to the internet and try again ',
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),

        alignment: Alignment.bottomCenter,
        direction: TextDirection.ltr,
        animationDuration: const Duration(milliseconds: 300),
        animationBuilder: (context, animation, alignment, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        icon: const Icon(Icons.info),
        primaryColor: AppPallet.primaryLight,
        backgroundColor: AppPallet.primary,
        foregroundColor: AppPallet.primaryLight,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 16,
            offset: Offset(0, 16),
            spreadRadius: 0,
          )
        ],
        showProgressBar: false,
        closeButtonShowType: CloseButtonShowType.onHover,
        closeOnClick: false,
        pauseOnHover: true,
        dragToClose: true,
        applyBlurEffect: true,
        callbacks: ToastificationCallbacks(
          onTap: (toastItem) => debugPrint('Toast ${toastItem.id} tapped'),
          onCloseButtonTap: (toastItem) =>
              debugPrint('Toast ${toastItem.id} close button tapped'),
          onAutoCompleteCompleted: (toastItem) =>
              debugPrint('Toast ${toastItem.id} auto complete completed'),
          onDismissed: (toastItem) =>
              debugPrint('Toast ${toastItem.id} dismissed'),
        ),
      );
    }
  });
}

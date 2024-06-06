import 'package:flutter/material.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class Loader extends StatelessWidget {
  final Color? color;
  const Loader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            color: color ?? AppPallet.primary,
          )),
    );
  }
}

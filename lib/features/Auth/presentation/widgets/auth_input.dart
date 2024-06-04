import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/vertical-space.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class AuthInput extends StatelessWidget {
  final String title;
  final TextInputType inputType;
  const AuthInput({
    super.key,
    required this.title,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(space: 20.h),
        Text(
          title,
          style: TextStyle(fontSize: 15.sp, color: AppPallet.inputTitle),
        ),
        VerticalSpace(space: 8.h),
        TextFormField(
          keyboardType: inputType,
          cursorColor: AppPallet.inputHint,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: title,
          ),
        ),
      ],
    );
  }
}

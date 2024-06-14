import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/core/common/widgets/vertical_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';

class FormInput extends StatelessWidget {
  final String title;
  final TextInputType inputType;
  final TextEditingController? controller;
  final bool isObSecure, hideTitle;

  const FormInput(
      {super.key,
      required this.title,
      this.controller,
      this.inputType = TextInputType.text,
      this.isObSecure = false,
      this.hideTitle = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!hideTitle) ...[
          VerticalSpace(space: 20.h),
          Text(
            title,
            style: TextStyle(fontSize: 15.sp, color: AppPallet.inputTitle),
          ),
          VerticalSpace(space: 8.h),
        ],
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: isObSecure,
          cursorColor: AppPallet.inputHint,
          style: TextStyle(fontSize: 14.sp),
          validator: (value) {
            if (value!.isEmpty) {
              return "$title is required";
            }
            if (inputType == TextInputType.emailAddress) {
              final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value);
              if (!emailValid) {
                return 'Email is not valid';
              }
            }
            if (isObSecure && value.length < 4) {
              return 'Password must be more than 4 character';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: title,
          ),
        ),
      ],
    );
  }
}

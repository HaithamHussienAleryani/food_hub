import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/utils/get_translation.dart';
import 'package:food_hub/core/widgets/loader.dart';
import 'package:food_hub/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class SocialSignUp extends StatelessWidget {
  final VoidCallback? onTap;

  const SocialSignUp({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.goNamed('home');
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<AuthBloc>().add(AuthSignUpViaGoogle());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: AppPallet.whiteColor,
                border: Border.all(color: AppPallet.primary, width: 0.5),
                borderRadius: BorderRadius.circular(27)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: state is AuthLoadingViaGoogle
                  ? [const Loader()]
                  : [
                      SvgPicture.asset(
                        google,
                      ),
                      HorizontalSpace(space: 10.w),
                      Text(
                        getTranslation(context).google.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      )
                    ],
            ),
          ),
        );
      },
    );
  }
}

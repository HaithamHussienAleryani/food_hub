import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub/core/common/constants/images/images_constants.dart';
import 'package:food_hub/core/common/widgets/horizontal_space.dart';
import 'package:food_hub/core/theme/app_platte.dart';
import 'package:food_hub/core/widgets/loader.dart';
import 'package:food_hub/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
        //       decoration: BoxDecoration(
        //           color: AppPallet.whiteColor,
        //           borderRadius: BorderRadius.circular(27)),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SvgPicture.asset(
        //             facebook,
        //           ),
        //           HorizontalSpace(space: 10.w),
        //           Text(
        //             AppLocalizations.of(context)!.facebook.toUpperCase(),
        //             style: TextStyle(
        //               fontFamily: 'Sofia',
        //               fontWeight: FontWeight.w500,
        //               fontSize: 13.sp,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // HorizontalSpace(space: 40.w),
        Expanded(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                context.goNamed('home');
              }
            },
            builder: (context, state) => GestureDetector(
              onTap: () => context.read<AuthBloc>().add(AuthSignUpViaGoogle()),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: AppPallet.whiteColor,
                    borderRadius: BorderRadius.circular(27)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: state is AuthLoadingViaGoogle
                      ? [const Loader()]
                      : [
                          SvgPicture.asset(google),
                          HorizontalSpace(space: 10.w),
                          Text(
                            AppLocalizations.of(context)!.google.toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'Sofia',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          )
                        ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

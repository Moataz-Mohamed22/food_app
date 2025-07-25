import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/theme/app_styles.dart';
import 'package:food_app/core/utils/app_assets.dart';

import '../../../../config/theme/colors.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 475.h,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(75.r),
            bottomRight: Radius.circular(75.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 85.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(AppAssets.logo, height: 97.h, width: 94.w),
              SizedBox(height: 16.h),
              Text(
                "Deliver Favourite Food",
                style: AppStyles.semiBold21White,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

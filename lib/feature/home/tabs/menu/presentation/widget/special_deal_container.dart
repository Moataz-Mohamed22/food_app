import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/theme/app_styles.dart';
import 'package:food_app/config/theme/colors.dart';
import 'package:food_app/core/components/custom_button.dart';
import 'package:food_app/core/utils/app_assets.dart';

class SpecialDealContainer extends StatelessWidget {
  const SpecialDealContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 160.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special Deal For\nJuly",
                  style: AppStyles.semiBold17White,
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 99.w,
                  height: 50.h,
                  child: CustomButton(
                    text: "Buy Now",
                    onTap: () {},
                    isPrimary: false,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Image.asset(
              AppAssets.specialDeal,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

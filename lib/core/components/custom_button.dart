import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/app_styles.dart';
import '../../config/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final void Function()? onTap;

  const CustomButton({
    required this.text,
    required this.onTap,
    this.isPrimary = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      child: Text(
        text,
        style: isPrimary
            ? AppStyles.semiBold17White
            : AppStyles.semiBold17Primary,
      ),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(REdgeInsets.all(16)),
        fixedSize: MaterialStateProperty.all(Size(315.w, 56.h)),
        backgroundColor: WidgetStateProperty.all(
          isPrimary ? AppColors.primary : AppColors.white,
        ),
        foregroundColor: WidgetStateProperty.all(
          isPrimary ? AppColors.white : AppColors.primary,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
    );
  }
}

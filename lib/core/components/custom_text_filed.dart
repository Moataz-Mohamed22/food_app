import 'package:flutter/material.dart';

import '../../config/theme/app_styles.dart';
import '../../config/theme/colors.dart';


class CustomTextFormField extends StatelessWidget {
  final Color? borderColor;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool obscureText;
  final int? maxLines;
  final Color? filledColor;
  final bool? isFilled;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    this.borderColor,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.obscureText = false,
    this.maxLines,
    this.validator,
    this.controller,
    this.keyboardType,
    this.filledColor,
    this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      cursorColor: AppColors.secondary,
      style: style ?? AppStyles.regular12Black,
      decoration: InputDecoration(
        fillColor: filledColor ?? AppColors.lightBackground,
        filled: isFilled ?? true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? Colors.grey.shade300, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.regular12Black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/helpers/dialogue_utils.dart';
import 'package:food_app/core/helpers/validators.dart';
import '../../../../config/theme/app_styles.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_text_filed.dart';
import '../manager/auth_cubit.dart';
import '../manager/auth_states.dart';

class LoginForms extends StatelessWidget {
  const LoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          DialogueUtils.showMessage(context: context, message: state.message);
        }

        if (state is AuthSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login Success')));
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();

          return Container(
            padding: REdgeInsets.symmetric(vertical: 30.h, horizontal: 23.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [BoxShadow(color: AppColors.white, spreadRadius: 3)],
            ),
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login", style: AppStyles.bold25Black),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: cubit.emailController,
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.person),
                    validator:Validations.validateEmail,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: cubit.passwordController,
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    validator: Validations.validatePassword
                  ),
                  SizedBox(height: 20.h),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "Login",
                          onTap: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.login(
                                cubit.emailController.text.trim(),
                                cubit.passwordController.text.trim(),
                              );
                            }
                          },
                        ),
                  SizedBox(height: 10.h),
                  Text("OR", style: AppStyles.semiBold17Primary),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/images/google-icon 1.svg"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

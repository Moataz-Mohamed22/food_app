import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/routing/routes.dart';
import 'package:food_app/config/routing/routing_extensions.dart';
import 'package:food_app/feature/auth/presentation/widget/register_forms.dart';

import '../../../../config/theme/app_styles.dart';
import '../../../../core/di/di.dart';
import '../manager/auth_cubit.dart';
import '../widget/auth_container.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            child: Stack(
              children: [
                const AuthContainer(),

                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 320.h,
                      left: 25.w,
                      right: 25.w,
                    ),
                    child: Column(
                      children: [
                        RegisterForms(),
                        SizedBox(height: 30.h),
                        Text(
                          "Already have an account?",
                          style: AppStyles.semiBold14Black,
                        ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () => context.pushNamedAndRemoveUntil(
                            AppRoutes.loginRoute,
                            predicate: (Route<dynamic> route) => false,
                          ),
                          child: Text(
                            "Login",
                            style: AppStyles.semiBold17Primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

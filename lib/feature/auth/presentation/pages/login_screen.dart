import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/routing/routing_extensions.dart';
import 'package:food_app/config/theme/app_styles.dart';
import 'package:food_app/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:food_app/feature/auth/presentation/widget/auth_container.dart';
import 'package:food_app/feature/auth/presentation/widget/login_forms.dart';

import '../../../../config/routing/routes.dart';
import '../../../../core/di/di.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                        top: 320.h, left: 25.w, right: 25.w),
                    child: Column(
                      children: [
                        LoginForms(),
                        SizedBox(height: 30.h),
                        Text(
                          "Don’t have an account?",
                          style: AppStyles.semiBold14Black,
                        ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                            onTap: () => context.pushNamedAndRemoveUntil(
                              AppRoutes.registerRoute,
                              predicate: (Route<dynamic> route) => false,
                            ),
                            child: Text("REGISTER",
                              style: AppStyles.semiBold17Primary,)
                        )

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

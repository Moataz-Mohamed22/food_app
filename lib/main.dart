import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/routing/routes.dart';
import 'package:food_app/config/theme/theme.dart';
import 'package:food_app/feature/auth/presentation/pages/login_screen.dart';
import 'package:food_app/feature/auth/presentation/pages/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/feature/home/presentation/ui/home_screen.dart';
import 'package:food_app/feature/home/tabs/cart/presentation/ui/cart_screen.dart';
import 'package:food_app/feature/home/tabs/menu/presentation/pages/menu_screen.dart';
import 'package:food_app/feature/home/tabs/profile/presentation/pages/profile_screen.dart';
import 'core/di/di.dart';
import 'core/firebase/firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  await ScreenUtil.ensureScreenSize();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              AppRoutes.loginRoute :(context)=>LoginScreen(),
              AppRoutes.registerRoute :(context)=>RegisterScreen(),
              AppRoutes.home :(context)=>HomeScreen(),
              AppRoutes.profile :(context)=>ProfileScreen(),
              AppRoutes.cart :(context)=>CartScreen(),
              AppRoutes.menu :(context)=>MenuScreen(),


            },
            initialRoute: AppRoutes.home,
            theme: AppTheme.appTheme,

          );
        });
  }

}
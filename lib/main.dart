import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_assignment/screens/enable_location_screen.dart';
import 'package:sm_technology_assignment/screens/login/forgot_password_screen.dart';
import 'package:sm_technology_assignment/screens/login/reset_password_screen.dart';
import 'package:sm_technology_assignment/screens/login/signin_screen.dart';
import 'package:sm_technology_assignment/screens/login/signup_screen.dart';
import 'package:sm_technology_assignment/screens/login/verify_code_screen.dart';
import 'package:sm_technology_assignment/screens/onboarding/onboarding_1.dart';
import 'package:sm_technology_assignment/screens/onboarding/select_language.dart';
import 'package:sm_technology_assignment/screens/onboarding/splash_screen.dart';

import 'app/app_routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
        GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
        GetPage(name: AppRoutes.signin, page: () => SignInScreen()),
        GetPage(name: AppRoutes.signup, page: () => SignUpScreen()),
        GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordScreen()),
        GetPage(name: AppRoutes.resetPassword, page: () => ResetPasswordScreen()),
        GetPage(name: AppRoutes.varifyCode, page: () => VerifyCodeScreen()),
        GetPage(name: AppRoutes.enableLocation, page: () => EnableLocationScreen()),
        GetPage(name: AppRoutes.selectLanguage, page: () => SelectLanguageScreen()),

      ],
    );
  }
}

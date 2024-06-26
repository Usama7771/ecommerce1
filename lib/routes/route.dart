

// import 'package:ecommerce/OnboardingPage/onboarding_page.dart';
// import 'package:ecommerce/home_page.dart';
// import 'package:ecommerce/login_page.dart';
// import 'package:ecommerce/sign_up_page.dart';
// import 'package:ecommerce/splash_page.dart';
import 'package:android_proj/OnboardingPage/onboarding_page.dart';
import 'package:android_proj/home_page.dart';
import 'package:android_proj/login_page.dart';
import 'package:android_proj/sign_up_page.dart';
import 'package:android_proj/splash_page.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

Route<dynamic>? onGenerate(RouteSettings settings){
  switch(settings.name){
    case AppRouter.splashScreen:
      return MaterialPageRoute(builder: (_) => SplashPage());
    case AppRouter.onboarding:
      return MaterialPageRoute(builder: (_) => OnboardingPage());
    case AppRouter.login:
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case AppRouter.home:
      return MaterialPageRoute(builder: (_) => HomePage());
    case AppRouter.signup:
      return MaterialPageRoute(builder: (_) => const SignUpPage());
    default : return MaterialPageRoute(builder: (_) => const SplashPage());
  }
}
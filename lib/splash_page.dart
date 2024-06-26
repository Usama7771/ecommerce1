import 'dart:async';
// import 'package:ecommerce/login_page.dart';
// import 'package:ecommerce/shared/cache_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/OnboardingPage/onboarding_page.dart';
// import 'package:ecommerce/wigets/default_text.dart';

import 'package:android_proj/OnboardingPage/onboarding_page.dart';
import 'package:android_proj/home_page.dart';
import 'package:android_proj/login_page.dart';
import 'package:android_proj/shared/cache_helper.dart';
import 'package:android_proj/wigets/default_text.dart';
import 'package:flutter/material.dart';

import 'enum.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => CacheHelper.getBool(key: SharedKey.OnboardingIsLast)
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                (route) => false)
            : Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => OnboardingPage()),
                (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(
                text: 'Welcome to mostaql !',
                fontSize: 30,
                fontStyle: FontStyle.italic,
              )
            ],
          ),
        ),
      ),
    );
  }
}

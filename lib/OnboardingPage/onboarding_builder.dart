import 'package:android_proj/OnboardingPage/onboarding_model.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/OnboardingPage/onboarding_model.dart';

import '../wigets/default_text.dart';

// ignore: must_be_immutable
class OnboardingPageBuilder extends StatelessWidget {
  OnboardingModel onboardingModel;
  OnboardingPageBuilder({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(onboardingModel.image),
            const SizedBox(height: 30,),
             DefaultText(text: onboardingModel.disc, fontSize: 26, fontStyle: FontStyle.italic,),
          ],
        ),
      ),
    );
  }
}
// import 'package:ecommerce/enum.dart';
// import 'package:ecommerce/shared/cache_helper.dart';
import 'package:android_proj/OnboardingPage/onboarding_builder.dart';
import 'package:android_proj/OnboardingPage/onboarding_model.dart';
import 'package:android_proj/enum.dart';
import 'package:android_proj/login_page.dart';
import 'package:android_proj/shared/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:ecommerce/OnboardingPage/onboarding_builder.dart';
// import 'package:ecommerce/OnboardingPage/onboarding_model.dart';
// import 'package:ecommerce/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../wigets/default_text.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.grey[600]),
        backgroundColor: Colors.grey[100],
        shadowColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false);
              },
              child: DefaultText(
                text: 'Skip',
                fontSize: 15,
                color: Colors.indigo,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Expanded(
              flex: 8,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: OnboardingItem.length,
                  itemBuilder: (context, index) {
                    return OnboardingPageBuilder(
                      onboardingModel: OnboardingItem[index],
                    );
                  },
                  onPageChanged: (int index){
                    if(index == OnboardingItem.length-1){
                      setState(() {
                        isLast = true;
                        CacheHelper.putBool(value: isLast, key: SharedKey.OnboardingIsLast);
                      });
                    }
                    else{setState(() {
                      isLast = false;
                    });}
                  },),
            ),
            Expanded(
              child: SmoothPageIndicator(
                controller: pageController,
                count: OnboardingItem.length,
                axisDirection: Axis.horizontal,
                effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.indigo),
              ),
            ),
            Expanded(
              child: Visibility(
                visible: isLast,
                replacement: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                      onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (_) => const LoginPage()),
                  //     (route) => false);
                              },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    ),
                          
                      child: DefaultText(text: 'Next', fontSize: 14),
                    ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => true);
              },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  ),
                        
                    child: DefaultText(text: 'Lets go !', fontSize: 14),
                  ),
                  
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

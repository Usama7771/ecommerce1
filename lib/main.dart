// import 'package:ecommerce/routes/app_router.dart';
// import 'package:ecommerce/routes/route.dart';
// import 'package:ecommerce/shared/cache_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/splash_page.dart';

import 'package:android_proj/routes/app_router.dart';
import 'package:android_proj/routes/route.dart';
import 'package:android_proj/shared/cache_helper.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      onGenerateRoute: onGenerate,
      initialRoute: AppRouter.splashScreen,
    );
  }
}

import 'package:es3_proj/app/core/ui/theme/theme_config.dart';
import 'package:es3_proj/app/pages/home/home_router.dart';
import 'package:es3_proj/app/pages/book_detail/book_detail_router.dart';
import 'package:es3_proj/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class ES3AppWidget extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();
  ES3AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navKey,
      title: 'ES3 Project - Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => HomeRouter.page,
        '/bookDetail': (context) => ProductDetailRouter.page,
      },
    );
  }
}

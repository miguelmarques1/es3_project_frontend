import 'package:es3_proj/app/core/ui/theme/theme_config.dart';
import 'package:es3_proj/app/pages/home/home_router.dart';
import 'package:es3_proj/app/pages/book_details/book_details_router.dart';
import 'package:flutter/material.dart';
import 'package:regex_router/regex_router.dart';

class ES3AppWidget extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();
  ES3AppWidget({super.key});

  final router = RegexRouter.create({
    "/": (context, _) => HomeRouter.page,
    "/bookDetails/:bookId": (context, args) => BookDetailsRouter.page,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navKey,
      title: 'ES3 Project - Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      onGenerateRoute: router.generateRoute,
    );
  }
}

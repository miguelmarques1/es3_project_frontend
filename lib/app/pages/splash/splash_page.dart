import 'package:es3_proj/app/core/ui/helpers/size_extensions.dart';
import 'package:es3_proj/app/core/ui/widgets/es3_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: context.screenWidth,
                  child: Image.asset('assets/images/background.jpg',
                      fit: BoxFit.cover)),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.30),
                  ),
                  SizedBox(
                    width: context.percentHeight(.3),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ES3Button(
                    label: 'ACESSAR',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    width: context.percentWidth(.6),
                    height: 35,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

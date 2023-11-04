import 'package:flutter/material.dart';

class TopLeftLogo extends StatelessWidget {
  const TopLeftLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 100,
        height: 70,
        child: Image(
          image: AssetImage("images/SplashPage/bullet_logo.PNG"),
        ),
      ),
    );
  }
}

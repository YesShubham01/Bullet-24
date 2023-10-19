import 'package:bullet24/Pages/Start%20Page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Res/Theme/theme.dart';

import 'bullet_animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StartPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_THEME_COLOR,
      body: const Center(
        child: Hero(tag: 'bullet', child: BulletAnimation()),
      ),
    );
  }
}

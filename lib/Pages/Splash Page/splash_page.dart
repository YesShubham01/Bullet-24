import 'package:bullet24/Pages/Select%20Page/select_page.dart';
import 'package:bullet24/Res/Widget/logo_animated.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Res/Theme/theme.dart';

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
            builder: (context) => const SelectPage(),
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
        child: AnimatedBulletLogo(),
      ),
    );
  }
}

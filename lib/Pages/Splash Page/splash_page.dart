import 'package:bullet24/Pages/Login%20Page/login_page.dart';
import 'package:bullet24/Pages/Select%20Page/select_page.dart';
import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Res/Widget/logo_animated.dart';
import 'package:bullet24/Services/FireAuth%20Service/authentication.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _checkAuthenticationAndNavigate() async {
    if (Authenticate.isLoggedIn()) {
      context.read<MyProvider>().setLogined(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectPage()),
      );
    } else {
      context.read<MyProvider>().setLogined(false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding to schedule navigation after build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        _checkAuthenticationAndNavigate();
      });
    });
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

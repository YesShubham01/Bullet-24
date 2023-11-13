import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import '../../Widgets/google_sign_in_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 234, 232, 232),
        child: ListView(
          children: [
            Container(
              height: 200,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 206, 224, 234),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: shadow_false,
                    blurRadius: 4,
                    offset: const Offset(-2, 6),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Image.asset("images/SplashPage/bullet_logo.PNG"),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 150),
              child: Center(
                child: GoogleSignInButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

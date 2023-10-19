import 'package:bullet24/Pages/Splash%20Page/bullet_animation.dart';
import 'package:bullet24/Temp/animation_testing.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Hero(tag: 'bullet', child: BulletAnimation()),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimationTest()),
                  );
                },
                child: const Text("Animation Text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

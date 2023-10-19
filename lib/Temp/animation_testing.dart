import 'package:bullet24/Temp/animation2.dart';
import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({super.key});

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        // #enddocregion addListener
        setState(() {
          // The state that has changed here is the animation object's value.
        });
        // #docregion addListener
      });
    // #enddocregion addListener
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return SizedBox(
                  width: animation.value, // Use the animated value for width
                  height: animation.value, // Use the animated value for height
                  child: child,
                );
              },
              child: const Image(
                image: AssetImage("images/icon.png"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedCircle()),
                );
              },
              child: const Text('Animation 2'),
            ),
          ],
        ),
      ),
    );
  }
}

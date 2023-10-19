import 'package:flutter/material.dart';

class BulletAnimation extends StatefulWidget {
  const BulletAnimation({Key? key}) : super(key: key);

  @override
  State<BulletAnimation> createState() => _BulletAnimationState();
}

class _BulletAnimationState extends State<BulletAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 2), // You can adjust the duration as needed
      // You can also specify the animation curve if you want a custom easing effect
    )..repeat(); // Repeats the animation infinitely

    // Forward the animation controller when the widget is first initialized
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 225,
          top: 115,
          child: RotationTransition(
            turns: _controller, // Use the animation controller for rotation
            child: const SizedBox(
              height: 110,
              child: Image(
                image: AssetImage("images/SplashPage/front_wheel.PNG"),
              ),
            ),
          ),
        ),
        Positioned(
          left: 21,
          top: 110,
          child: RotationTransition(
            turns:
                _controller, // Use the same animation controller for both wheels
            child: const SizedBox(
              height: 120,
              child: Image(
                image: AssetImage("images/SplashPage/front_wheel.PNG"),
              ),
            ),
          ),
        ),
        const Image(
          image: AssetImage("images/SplashPage/bullet_without_rim.PNG"),
        ),
        // const Image(
        //   image: AssetImage("images/SplashPage/road.PNG"),
        // ),
      ],
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose the animation controller to avoid memory leaks
    super.dispose();
  }
}

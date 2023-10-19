import 'package:bullet24/Temp/animation3.dart';
import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({super.key});

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(
        reverse: true); // Repeats the animation forward and then in reverse
    _animation = Tween<double>(
      begin: 50.0, // Initial size of the circle
      end: 150.0, // Final size of the circle
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animated Circle'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  height: 190,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Animation3()),
                );
              },
              child: const Text('Animation 3'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose the animation controller to avoid memory leaks
    super.dispose();
  }
}

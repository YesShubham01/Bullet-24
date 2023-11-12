import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        height: 15,
        width: 15,
      ),
    );
  }
}

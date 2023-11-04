import 'package:flutter/material.dart';

import 'bullet_animation.dart';

class AnimatedBulletLogo extends StatelessWidget {
  const AnimatedBulletLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Hero(tag: 'bullet', child: BulletAnimation());
  }
}

import 'package:flutter/material.dart';

import 'circular_container.dart';

class ProgressBarForm extends StatelessWidget {
  final int progress;
  const ProgressBarForm({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10,
              top: 0,
            ),
            child: Divider(thickness: 3),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularContainer(),
                CircularContainer(),
                CircularContainer(),
                CircularContainer(),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 0,
            left: progressLeftPadding(),
            child: ClipOval(
              child: Container(
                padding: EdgeInsets.only(left: progressLeftPadding()),
                color: Colors.blue,
                height: 15,
                width: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  progressLeftPadding() {
    switch (progress) {
      case 1:
        return 60.00;
      case 2:
        return 135.00;
      case 3:
        return 210.00;
      case 4:
        return 285.00;
    }
  }
}

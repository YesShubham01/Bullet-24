import 'package:flutter/material.dart';

import '../../../../../Widgets/circular_container.dart';

class ProgressBarForm extends StatelessWidget {
  final int progress;
  const ProgressBarForm({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 20 - (15 * 4);
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 5),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 5),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 5),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 5),
                child: const CircularContainer(),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 0,
            left: progressLeftPadding(screenWidth),
            child: ClipOval(
              child: Container(
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

  double progressLeftPadding(double screenWidth) {
    // 15 is a special number here because it's width of container
    double padding = (screenWidth / 5); // Adjust this as needed
    switch (progress) {
      case 1:
        return padding;
      case 2:
        return 2 * padding + 15;
      case 3:
        return 3 * padding + 30;
      case 4:
        return 4 * padding + 45;
      default:
        return 0;
    }
  }
}

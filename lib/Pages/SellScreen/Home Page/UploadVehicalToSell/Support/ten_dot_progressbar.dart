import 'package:flutter/material.dart';

import '../../../../../Widgets/circular_container.dart';

class ProgressBar10Dots extends StatelessWidget {
  final int progress;
  final int numberOfCircles;
  final double circleSize;

  const ProgressBar10Dots(
      {super.key,
      required this.progress,
      this.circleSize = 15,
      this.numberOfCircles = 9});

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - 20 - (circleSize * numberOfCircles);
    // horizontal padding is 20 and 15 is width of container * no. of container.
    double paddingDivision = screenWidth / 11; // 10 is no. of container here.
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Divider(thickness: 3),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(left: paddingDivision),
                child: const CircularContainer(),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 0,
            left: progressLeftPadding(screenWidth, paddingDivision),
            child: ClipOval(
              child: Container(
                color: Colors.blue,
                height: circleSize,
                width: circleSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double progressLeftPadding(double screenWidth, double paddingDivision) {
    // 15 is a special number here because it's width of container
    double padding = paddingDivision;

    return (progress * padding) + (progress * circleSize) - circleSize;
  }
}

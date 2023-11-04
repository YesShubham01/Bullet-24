import 'package:flutter/material.dart';

class HotDealSectionCard extends StatelessWidget {
  const HotDealSectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          height: 130,
          width: 230,
          decoration: ShapeDecoration(
            color: const Color(0xFFEDEEF0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFF496A9F),
                blurRadius: 4,
                offset: Offset(-2, 6),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

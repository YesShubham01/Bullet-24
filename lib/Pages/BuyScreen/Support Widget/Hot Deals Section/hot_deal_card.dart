import 'package:bullet24/Res/Theme/theme.dart';
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
            color: BS_FSG_button_false_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows:  [
              BoxShadow(
                color: shadow_false,
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

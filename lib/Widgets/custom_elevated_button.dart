import 'package:flutter/material.dart';

import '../Res/Theme/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  const CustomElevatedButton(
      {super.key, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          ontap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: B_TNAV_COLOR, // Set button background color to blue
          foregroundColor: BS_FSG_button_false_color,
          elevation: 4, // Set elevation (shadow) for the button
          shadowColor: shadow_false, // Set shadow color
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

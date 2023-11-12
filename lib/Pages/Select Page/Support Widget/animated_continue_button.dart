import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class AnimatedContinueButton extends StatefulWidget {
  final bool active;
  final VoidCallback onTap;
  const AnimatedContinueButton(
      {super.key, required this.active, required this.onTap});

  @override
  State<AnimatedContinueButton> createState() => _AnimatedContinueButtonState();
}

class _AnimatedContinueButtonState extends State<AnimatedContinueButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: widget.active ? 329 : 310,
        height: widget.active ? 60 : 50,
        decoration: ShapeDecoration(
          color: widget.active ? Colors.blue : Continue_false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: widget.active ? BS_Cshadow_active_color : shadow_false,
              blurRadius: 4,
              offset: const Offset(-2, 6),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Center(
          child: Text(
            'Continue',
            style: TextStyle(
              color: Color(0xFFEDEEF0),
              fontSize: 26,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

//!!! Delete this later

class ContinueButton extends StatelessWidget {
  final bool active;
  final VoidCallback onTap;
  const ContinueButton({super.key, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: const Color(0xFF496A9F),
          backgroundColor:
              active ? const Color(0xFF4E80D0) : const Color(0xFFA7B3C6),
          foregroundColor: const Color(0xFFD1DAE7),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: const Text(
          "Continue",
          style: TextStyle(
            color: Color(0xFFD1DAE7),
            fontSize: 22,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

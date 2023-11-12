import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShapeDecoration(
        color: BS_FSG_button_false_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: shadow_false,
            blurRadius: 4,
            offset: const Offset(-2, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Center(
        child: TextField(
          // Your TextField properties go here
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

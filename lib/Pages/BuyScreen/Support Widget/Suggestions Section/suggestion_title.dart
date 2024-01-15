import 'package:flutter/material.dart';

class HomPageSectionTitle extends StatelessWidget {
  final String title;
  const HomPageSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Spacer(),
          // TextButton(onPressed: () {}, child: const Text("See more"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SuggestionSectionTitle extends StatelessWidget {
  const SuggestionSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            "Suggestions",
            style: TextStyle(
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

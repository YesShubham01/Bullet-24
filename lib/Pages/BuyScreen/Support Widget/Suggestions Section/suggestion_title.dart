import 'package:flutter/material.dart';

class SuggestionSectionTitle extends StatelessWidget {
  const SuggestionSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Text(
            "Suggestion",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text("See more"))
        ],
      ),
    );
  }
}

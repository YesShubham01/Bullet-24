import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/double_item_tiles.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/suggestion_title.dart';
import 'package:flutter/material.dart';

class SuggestionSection extends StatefulWidget {
  const SuggestionSection({super.key});

  @override
  State<SuggestionSection> createState() => _SuggestionSectionState();
}

class _SuggestionSectionState extends State<SuggestionSection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SuggestionSectionTitle(),
        DoubleVehicalItemTile(),
        DoubleVehicalItemTile(),
      ],
    );
  }
}

import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Hot%20Deals%20Section/hot_deal_card.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  final String model;
  const FilterPage({super.key, required this.model});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.model); // bullet350
    print("here");
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Hero(
            tag: "banner",
            child: HotDealSectionCard(
              model: widget.model,
              enableTab: false,
            ),
          ),
        ],
      ),
    );
  }
}

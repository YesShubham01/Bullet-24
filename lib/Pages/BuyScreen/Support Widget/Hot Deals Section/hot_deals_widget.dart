import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Hot%20Deals%20Section/hot_deal_card.dart';
import 'package:flutter/material.dart';

class HotDealsSection extends StatefulWidget {
  const HotDealsSection({super.key});

  @override
  State<HotDealsSection> createState() => _HotDealsSectionState();
}

class _HotDealsSectionState extends State<HotDealsSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const HotDealSectionCard();
          }),
    );
  }
}

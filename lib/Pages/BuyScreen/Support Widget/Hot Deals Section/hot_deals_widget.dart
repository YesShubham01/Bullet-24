import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Hot%20Deals%20Section/hot_deal_card.dart';
import 'package:flutter/material.dart';

class HotDealsSection extends StatefulWidget {
  const HotDealsSection({super.key});

  @override
  State<HotDealsSection> createState() => _HotDealsSectionState();
}

class _HotDealsSectionState extends State<HotDealsSection> {
  final List<String> model = [
    'bullet350',
    'classic350',
    'hunter350',
    'scram411',
    'meteor350',
    'superMeteor650',
    'himalayan',
    'newHimalayan',
    'interceptor',
    'continentalGT',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: model.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return HotDealSectionCard(
              model: model[index],
            );
          }),
    );
  }
}

import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/item_tile.dart';
import 'package:flutter/material.dart';

class DoubleVehicalItemTile extends StatelessWidget {
  const DoubleVehicalItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        VehicalItemTile(),
        VehicalItemTile(),
      ],
    );
  }
}

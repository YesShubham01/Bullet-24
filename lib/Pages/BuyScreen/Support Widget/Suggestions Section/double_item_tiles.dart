import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/item_tile.dart';
import 'package:flutter/material.dart';

class DoubleVehicalItemTile extends StatefulWidget {
  final VehicalDetail firstVehical;
  final VehicalDetail? secondVehical;

  const DoubleVehicalItemTile({
    Key? key,
    required this.firstVehical,
    this.secondVehical,
  }) : super(key: key);

  @override
  State<DoubleVehicalItemTile> createState() => _DoubleVehicalItemTileState();
}

class _DoubleVehicalItemTileState extends State<DoubleVehicalItemTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        VehicalItemTile(vehicalDetail: widget.firstVehical),
        if (widget.secondVehical != null)
          VehicalItemTile(vehicalDetail: widget.secondVehical!),
      ],
    );
  }
}

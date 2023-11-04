import 'dart:ffi';

import 'package:bullet24/Pages/BuyScreen/Item%20Page/item_page.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Res/Theme/theme.dart';

class VehicalItemTile extends StatelessWidget {
  const VehicalItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start (left)
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ItemPage()));
            },
            child: Container(
              height: 140,
              width: 140,
              decoration: ShapeDecoration(
                color: BS_FSG_button_false_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows:  [
                  BoxShadow(
                    color: shadow_false,
                    blurRadius: 4,
                    offset: Offset(-2, 6),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: Text(
              "Name of model",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "\$ price",
              style: TextStyle(
                fontSize: 14,
                color: B_TNAV_COLOR,
              ),
            ),
          )
        ],
      ),
    );
  }
}

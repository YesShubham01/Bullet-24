import 'package:bullet24/Pages/BuyScreen/Item%20Page/item_page.dart';
import 'package:flutter/material.dart';

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
                color: const Color(0xFFEDEEF0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0xFF496A9F),
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
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "\$ price",
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}

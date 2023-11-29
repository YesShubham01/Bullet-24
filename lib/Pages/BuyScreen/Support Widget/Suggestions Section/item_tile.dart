import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Pages/BuyScreen/Item%20Page/item_page.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Res/Theme/theme.dart';

class VehicalItemTile extends StatelessWidget {
  final VehicalDetail vehicalDetail;

  const VehicalItemTile({Key? key, required this.vehicalDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // You may want to navigate to a detailed page with vehicalDetail
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ItemPage(vehicalDetail: vehicalDetail)));
            },
            child: Container(
              height: 140,
              width: 140,
              decoration: ShapeDecoration(
                color: BS_FSG_button_false_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: shadow_false,
                    blurRadius: 4,
                    offset: const Offset(-2, 6),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Text(
              vehicalDetail.ownerName, // Use actual property from VehicalDetail
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "\$${vehicalDetail.estPrice}", // Use actual property from VehicalDetail
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

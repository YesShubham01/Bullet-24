import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class SellerHomePageOr extends StatelessWidget {
  const SellerHomePageOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          color:B_TNAV_COLOR,
        )),
        const Text(
          "OR",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
            child: Divider(
          color: B_TNAV_COLOR,
        )),
      ]),
    );
  }
}

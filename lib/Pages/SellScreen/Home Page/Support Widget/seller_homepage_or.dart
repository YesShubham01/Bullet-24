import 'package:flutter/material.dart';

class SellerHomePageOr extends StatelessWidget {
  const SellerHomePageOr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          color: Colors.blue,
        )),
        Text(
          "OR",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
            child: Divider(
          color: Colors.blue,
        )),
      ]),
    );
  }
}

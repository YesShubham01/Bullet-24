import 'package:bullet24/Pages/SellScreen/Home%20Page/Support%20Widget/seller_homepage_or.dart';
import 'package:flutter/material.dart';

import 'Support Widget/estimate_your_price_button.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        YourVehicalPrice(
            buttontxt: "Estimate Vehicle Price",
            txt: "Estimate worth of your vehicle.",
            toEstimatePage: true),
        SellerHomePageOr(), // is it a divider with Or text in middle.
        YourVehicalPrice(
          txt: "Sell your vehicle with Bullet24.",
          buttontxt: "Sell your vehicle",
          toEstimatePage: false,
        ),
      ],
    );
  }
}

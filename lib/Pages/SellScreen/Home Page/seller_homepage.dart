import 'package:bullet24/Pages/SellScreen/Home%20Page/Support%20Widget/seller_homepage_or.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Support%20Widget/start_with_car_number.dart';
import 'package:flutter/material.dart';

import 'Support Widget/start_with_car_brand.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 80,
        ),
        StartSellingWithCarNumber(),
        SellerHomePageOr(),
        StartSellingWithCarBrand(),
      ],
    );
  }
}

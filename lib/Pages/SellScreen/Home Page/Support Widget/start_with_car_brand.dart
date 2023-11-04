import 'package:flutter/material.dart';

class StartSellingWithCarBrand extends StatefulWidget {
  const StartSellingWithCarBrand({super.key});

  @override
  State<StartSellingWithCarBrand> createState() =>
      _StartSellingWithCarBrandState();
}

class _StartSellingWithCarBrandState extends State<StartSellingWithCarBrand> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      child: Center(
        child: Container(
          width: width,
          height: 340,
          decoration: ShapeDecoration(
            color: const Color(0xFFEDEEF0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFF496A9F),
                blurRadius: 4,
                offset: Offset(-2, -4),
                spreadRadius: 0,
              )
            ],
          ),
          child: const Column(
            children: [
              Text(
                "Start with your vehical Brand",
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

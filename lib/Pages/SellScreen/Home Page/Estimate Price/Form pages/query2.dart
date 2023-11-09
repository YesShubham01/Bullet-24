import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

import '../Support Widget/Query2 Support/year_picker.dart';

class QueryScreen2 extends StatefulWidget {
  const QueryScreen2({Key? key}) : super(key: key);

  @override
  State<QueryScreen2> createState() => _QueryScreen2State();
}

class _QueryScreen2State extends State<QueryScreen2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSection("Enter Year of Model Released", ofPurchase: false),
          const SizedBox(height: 60),
          _buildSection("Enter Year of Purchase", ofPurchase: true),
        ],
      ),
    );
  }

  Widget _buildSection(String title, {required bool ofPurchase}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
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
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          const Divider(
            thickness: 3,
          ),
          const SizedBox(height: 10),
          Center(
            child: YearPickerWithShadows(ofPurchase: ofPurchase),
          ),
        ],
      ),
    );
  }
}

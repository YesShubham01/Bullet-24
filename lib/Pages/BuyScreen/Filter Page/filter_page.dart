import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Hot%20Deals%20Section/hot_deal_card.dart';
import 'package:bullet24/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';

import '../Support Widget/Suggestions Section/double_item_tiles.dart';

class FilterPage extends StatefulWidget {
  final String model;
  const FilterPage({super.key, required this.model});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Hero(
            tag: "banner",
            child: HotDealSectionCard(
              model: widget.model,
              enableTab: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(thickness: 4),
          ),
          FutureBuilder(
            future: FireStore.fetchVehicalsByModel(
                mapStringToBulletModel(widget.model)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while data is being fetched
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Show an error message if there's an error
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                // Show a message if no data is available
                return const Text('No vehicle details available.');
              } else {
                // Display DoubleVehicalItemTile for each item in suggestionList
                List<VehicalDetail> suggestionList = snapshot.data!;
                return Column(
                  children: [
                    for (int i = 0; i < suggestionList.length; i += 2)
                      DoubleVehicalItemTile(
                        firstVehical: suggestionList[i],
                        secondVehical: (i + 1 < suggestionList.length)
                            ? suggestionList[i + 1]
                            : null,
                      ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  BulletModel mapStringToBulletModel(String modelName) {
    switch (modelName) {
      case 'bullet350':
        return BulletModel.bullet350;
      case 'classic350':
        return BulletModel.classic350;
      case 'hunter350':
        return BulletModel.hunter350;
      case 'scram411':
        return BulletModel.scram411;
      case 'meteor350':
        return BulletModel.meteor350;
      case 'superMeteor650':
        return BulletModel.superMeteor650;
      case 'himalayan':
        return BulletModel.himalayan;
      case 'newHimalayan':
        return BulletModel.newHimalayan;
      case 'interceptor':
        return BulletModel.interceptor;
      case 'continentalGT':
        return BulletModel.continentalGT;
      default:
        throw ArgumentError('Invalid model name: $modelName');
    }
  }
}

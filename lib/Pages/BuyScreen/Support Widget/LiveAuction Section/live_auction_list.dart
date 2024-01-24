import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/double_item_tiles.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/item_tile.dart';
import 'package:bullet24/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';

class LiveAuctionList extends StatelessWidget {
  const LiveAuctionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: FutureBuilder<List<VehicalDetail>>(
        future: FireStore.searchVehiclesWithBid(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<VehicalDetail> vehicles = snapshot.data ?? [];

            if (vehicles.isEmpty) {
              return const Text('No vehicles with bid values.');
            } else {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < vehicles.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Badge(
                          label: const Text("Live"),
                          child: VehicalItemTile(vehicalDetail: vehicles[i])),
                    )
                ],
              );
            }
          }
        },
      ),
    );
  }
}

import 'package:bullet24/Pages/BuyScreen/Support%20Widget/LiveAuction%20Section/live_auction_list.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/suggestion_title.dart';
import 'package:flutter/material.dart';

class LiveAuctionSection extends StatelessWidget {
  const LiveAuctionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          HomPageSectionTitle(title: "Live Auction"),
          LiveAuctionList(),
        ],
      ),
    );
  }
}

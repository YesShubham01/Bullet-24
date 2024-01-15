import 'package:bullet24/Pages/BuyScreen/Home%20Page/homepage_header.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/LiveAuction%20Section/live_auction_section.dart';
import 'package:flutter/material.dart';

import '../Support Widget/Hot Deals Section/hot_deals_widget.dart';
import '../Support Widget/Suggestions Section/suggestion_section.dart';

//! Change ListView builder to ListView.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: const [
          HomePageHeader(),
          HotDealsSection(),
          LiveAuctionSection(),
          SuggestionSection(),
        ],
      ),
    );
  }
}

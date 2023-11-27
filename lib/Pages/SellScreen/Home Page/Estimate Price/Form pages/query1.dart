import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Support%20Widget/choose_model.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Support%20Widget/company_item.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueryScreen1 extends StatefulWidget {
  const QueryScreen1({super.key});

  @override
  State<QueryScreen1> createState() => _QueryScreen1State();
}

class _QueryScreen1State extends State<QueryScreen1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TwoCompanyItems(),
        Expanded(
          child: get2ndOption(),
        ),
      ],
    );
  }

  get2ndOption() {
    Company? chosenCompany =
        context.watch<QueryPageProvider>().myVehical!.company;
    if (chosenCompany == null) {
      return Container();
    } else if (chosenCompany == Company.royalEnfield) {
      return const GridModelTiles();
    } else {
      return Container();
    }
  }
}

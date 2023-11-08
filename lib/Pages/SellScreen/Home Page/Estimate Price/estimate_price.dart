import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query1.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query3.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query_result.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Form pages/query2.dart';
import 'Support Widget/progressbar_form.dart';

class EstimatePriceScreen extends StatefulWidget {
  const EstimatePriceScreen({super.key});

  @override
  State<EstimatePriceScreen> createState() => _EstimatePriceScreenState();
}

class _EstimatePriceScreenState extends State<EstimatePriceScreen> {
  int progress = 1;
  bool button_active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ProgressBarForm(progress: progress),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 550,
              child: get_queries(),
            ),
          ),
          getButtonIfActive(),
          Text("$progress"),
        ],
      ),
    );
  }

  nextProgress() {
    setState(() {
      if (progress < 4) {
        progress++;
      } else {
        progress = 1;
      }
    });
  }

  get_queries() {
    if (progress == 1) {
      return const QueryScreen1();
    } else if (progress == 2) {
      return const QueryScreen2();
    } else if (progress == 3) {
      return const QueryScreen3();
    } else if (progress == 4) {
      return const EstimateQueryResult();
    } else {
      return Container();
    }
  }

  getButtonIfActive() {
    button_active = context.watch<QueryPageProvider>().iscompanySelected;
    if (button_active) {
      return SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
          onPressed: nextProgress,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                B_TNAV_COLOR, // Set button background color to blue
            foregroundColor: BS_FSG_button_false_color,
            elevation: 4, // Set elevation (shadow) for the button
            shadowColor: shadow_false, // Set shadow color
          ),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

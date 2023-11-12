import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query1.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query3.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query_result.dart';
import 'package:bullet24/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'Form pages/query2.dart';
import 'Support Widget/progressbar_form.dart';

class EstimatePriceScreen extends StatefulWidget {
  const EstimatePriceScreen({super.key});

  @override
  State<EstimatePriceScreen> createState() => _EstimatePriceScreenState();
}

class _EstimatePriceScreenState extends State<EstimatePriceScreen> {
  int progress = 1;
  bool buttonActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Estimate Price"),
        // Subtitle: "Please provide the following details about your vehicle:"
      ),
      body: Column(
        children: [
          ProgressBarForm(progress: progress),
          Expanded(
            child: getQueries(),
          ),
          CustomElevatedButton(ontap: nextProgress, text: "Next"),
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

  getQueries() {
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
}

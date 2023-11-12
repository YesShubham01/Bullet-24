import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EstimateQueryResult extends StatefulWidget {
  const EstimateQueryResult({Key? key}) : super(key: key);

  @override
  State<EstimateQueryResult> createState() => _EstimateQueryResultState();
}

class _EstimateQueryResultState extends State<EstimateQueryResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Center(
            child: Text(
              "Estimate Price",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildInfoCard(
            title: 'Company',
            content: context
                .watch<QueryPageProvider>()
                .myVehical!
                .company
                .toString(),
          ),
          _buildInfoCard(
            title: 'Model',
            content:
                context.watch<QueryPageProvider>().myVehical!.model.toString(),
          ),
          _buildInfoCard(
            title: 'Year of Release',
            content: context
                .watch<QueryPageProvider>()
                .myVehical!
                .yearOfRelese
                .toString(),
          ),
          _buildInfoCard(
            title: 'Year of Purchase',
            content: context
                .watch<QueryPageProvider>()
                .myVehical!
                .yearOfPurchase
                .toString(),
          ),
          _buildInfoCard(
            title: 'Meter Reading',
            content: context
                .watch<QueryPageProvider>()
                .myVehical!
                .meterReading
                .toString(),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 22),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add your Vehicle To Sell Page."),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Contact us"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: BS_FSG_button_false_color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadow_false,
              blurRadius: 4,
              offset: const Offset(-2, 6),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Card(
          elevation: 0, // Set elevation to 0 to remove Card's default shadow
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

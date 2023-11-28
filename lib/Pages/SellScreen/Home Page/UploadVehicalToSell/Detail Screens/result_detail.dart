import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsResultScreen extends StatelessWidget {
  const DetailsResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VehicalDetail vehicalDetail = context.watch<QueryPageProvider>().myVehical!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          _buildInfoCard(title: 'Owner Name', content: vehicalDetail.ownerName),
          _buildInfoCard(
              title: 'Vehicle Number', content: vehicalDetail.number ?? ''),
          _buildInfoCard(
              title: 'Company',
              content: vehicalDetail.company?.toString() ?? ''),
          _buildInfoCard(
              title: 'Model', content: vehicalDetail.model?.toString() ?? ''),
          _buildInfoCard(
              title: 'Estimated Price', content: vehicalDetail.estPrice ?? ''),
          _buildInfoCard(
              title: 'Year of Release',
              content: vehicalDetail.yearOfRelese?.toString() ?? ''),
          _buildInfoCard(
              title: 'Year of Purchase',
              content: vehicalDetail.yearOfPurchase?.toString() ?? ''),
          _buildInfoCard(
              title: 'Meter Reading',
              content: vehicalDetail.meterReading?.toString() ?? ''),
          _buildInfoCard(
            title: 'Front Photo',
            content: vehicalDetail.frontPhoto ?? '',
          ),
          _buildInfoCard(
            title: 'Side Photo',
            content: vehicalDetail.sidePhoto ?? '',
          ),
          _buildInfoCard(
            title: 'Rear Photo',
            content: vehicalDetail.rearPhoto ?? '',
          ),
          _buildInfoCard(
            title: 'Tank Photo',
            content: vehicalDetail.tankPhoto ?? '',
          ),
          _buildInfoCard(
              title: 'RC Number',
              content: (vehicalDetail.rcNumber ?? '').toString()),
          _buildInfoCard(
              title: 'Insurance Details',
              content: (vehicalDetail.insuranceNumber ?? '').toString()),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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

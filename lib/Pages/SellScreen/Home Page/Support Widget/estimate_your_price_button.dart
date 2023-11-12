import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/estimate_price.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/UploadVehicalToSell/upload_vehical_to_sell.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YourVehicalPrice extends StatelessWidget {
  final String txt;
  final String buttontxt;
  final bool toEstimatePage;
  const YourVehicalPrice(
      {Key? key,
      this.buttontxt = "Sample",
      this.txt = "Sample",
      required this.toEstimatePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            txt,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                onTapFunction(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: BS_FSG_button_false_color,
                backgroundColor: B_TNAV_COLOR,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: shadow_false,
              ),
              child: Text(
                buttontxt,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapFunction(BuildContext context) {
    context.read<QueryPageProvider>().setCompanyOfVehical(null);
    context.read<QueryPageProvider>().checkInitialisationOfVehical();
    if (toEstimatePage) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const EstimatePriceScreen(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const UploadVehicalToSellPage(),
      ));
    }
  }
}

import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query1.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query2.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/Estimate%20Price/Form%20pages/query3.dart';
import 'package:bullet24/Pages/SellScreen/Home%20Page/UploadVehicalToSell/Detail%20Screens/result_detail.dart';
import 'package:flutter/material.dart';
// Make sure to import your circular container widget
import 'Detail Screens/insurance_detail.dart';
import 'Detail Screens/meter_reading_details.dart';
import 'Detail Screens/registration_details.dart';
import 'Detail Screens/tank_photo_upload.dart';
import 'Detail Screens/upload_vehical_images.dart';
import 'Support/ten_dot_progressbar.dart'; // Make sure to import your progress bar widget
import 'package:bullet24/Widgets/custom_elevated_button.dart';

class UploadVehicalToSellPage extends StatefulWidget {
  const UploadVehicalToSellPage({Key? key}) : super(key: key);

  @override
  State<UploadVehicalToSellPage> createState() =>
      _UploadVehicalToSellPageState();
}

class _UploadVehicalToSellPageState extends State<UploadVehicalToSellPage> {
  int progress = 1;
  String buttonText = "Next";
  bool resultPage = false; // Variable to control FAB visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Upload Vehical Details"),
        // Subtitle: "Please provide the following details about your vehicle:"
      ),
      floatingActionButton:
          CustomElevatedButton(ontap: proceed, text: buttonText),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8),
        child: Column(
          children: [
            ProgressBar10Dots(progress: progress),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Please provide details of your vehicle.",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Divider(
              thickness: 4,
            ),
            Expanded(
              child: getQueries(),
            ),
          ],
        ),
      ),
    );
  }

  getQueries() {
    // Check the progress and return the appropriate widget for each step
    if (progress == 1) {
      return const QueryScreen1();
    } else if (progress == 2) {
      return const QueryScreen2();
    } else if (progress == 3) {
      return const QueryScreen3();
    } else if (progress == 4) {
      return const FrontSideRearPhotos();
    } else if (progress == 5) {
      return const MeterReadingPhotos();
    } else if (progress == 6) {
      return const TankPhoto();
    } else if (progress == 7) {
      return const RegistrationDetails();
    } else if (progress == 8) {
      return const InsuranceDetails();
    } else {
      return const DetailsResultScreen(); // or any other default widget
    }
  }

  proceed() {
    if (progress < 9) {
      setState(() {
        progress++; // Next
      });
    } else {
      setState(() {
        progress = 1; // Reset
      });
    }
    _setButtonTxt();
  }

  void _setButtonTxt() {
    if (progress == 9) {
      setState(() {
        buttonText = "Submit";
      });
    } else {
      setState(() {
        buttonText = "Next";
      });
    }
  }
}

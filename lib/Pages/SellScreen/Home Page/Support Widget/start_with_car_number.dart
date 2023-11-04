import 'package:flutter/material.dart';

class StartSellingWithCarNumber extends StatefulWidget {
  const StartSellingWithCarNumber({super.key});

  @override
  State<StartSellingWithCarNumber> createState() =>
      _StartSellingWithCarNumberState();
}

class _StartSellingWithCarNumberState extends State<StartSellingWithCarNumber> {
  final TextEditingController _carNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _carNumberController,
            textAlign: TextAlign.center, // Center-align the text horizontally
            decoration: InputDecoration(
              labelText: 'Enter your car number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 2.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width:
                double.infinity, // Set width to take complete available width
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                // Perform action when the button is pressed
                // You can access the car number using _carNumberController.text
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Set button background color to blue
                foregroundColor: Colors.white,
                elevation: 4, // Set elevation (shadow) for the button
                shadowColor: const Color(0xFF496A9F), // Set shadow color
              ),
              child: const Text(
                'GET CAR PRICE',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
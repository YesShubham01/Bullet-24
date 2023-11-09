import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueryScreen3 extends StatefulWidget {
  const QueryScreen3({Key? key}) : super(key: key);

  @override
  State<QueryScreen3> createState() => _QueryScreen3State();
}

class _QueryScreen3State extends State<QueryScreen3> {
  final meterReadingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Enter the current meter reading",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: meterReadingController,
            decoration: InputDecoration(
              labelText: "Meter Reading",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              // Parse the input as an integer and update the meterReading property
              int? reading = int.tryParse(value);
              if (reading != null) {
                context.read<QueryPageProvider>().setMeterReading(reading);
              }
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Perform action on button click
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controller to prevent memory leaks
    meterReadingController.dispose();
    super.dispose();
  }
}

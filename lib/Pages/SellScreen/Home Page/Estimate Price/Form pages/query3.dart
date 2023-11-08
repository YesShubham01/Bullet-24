import 'package:flutter/material.dart';

class QueryScreen3 extends StatefulWidget {
  const QueryScreen3({super.key});

  @override
  State<QueryScreen3> createState() => _QueryScreen3State();
}

class _QueryScreen3State extends State<QueryScreen3> {
  final meterReadingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text("Meter Reading"),

        // i want some input widget for taking numeric input.
        TextField(
          controller: meterReadingController,
          decoration: const InputDecoration(
            labelText: "Enter Meter Reading",
            hintText: "Enter the current meter reading",
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}

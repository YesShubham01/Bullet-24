import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BidPage extends StatefulWidget {
  final String amount;
  final String vehicleId;

  const BidPage({super.key, required this.amount, required this.vehicleId});

  @override
  State<BidPage> createState() => _BidPageState();
}

class _BidPageState extends State<BidPage> {
  int bid_amount_1 = 0;
  int bid_amount_2 = 0;

  int convertStringToInt(String input) {
    // Remove commas from the string
    String sanitizedInput = input.replaceAll(',', '');

    // Parse the sanitized string to an integer
    try {
      return int.parse(sanitizedInput);
    } catch (e) {
      // Handle parsing errors if needed
      print('Error converting string to int: $e');
      return 0; // Default value or handle the error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = context.read<MyProvider>().userDetail.name.toString();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 100),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Current Bid",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            FutureBuilder<String>(
              future:
                  FireStore.checkAndUpdateBid(widget.vehicleId, widget.amount),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while the future is in progress
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle any errors that occurred during the Future execution
                  return Text('Error: ${snapshot.error}');
                } else {
                  // The Future is complete successfully
                  String bidValue = snapshot.data ?? "snapshot is null";
                  // You can use bidValue as needed
                  bid_amount_1 = convertStringToInt(bidValue) + 1000;
                  bid_amount_2 = convertStringToInt(bidValue) + 3000;

                  return Column(
                    children: [
                      Text(
                        bidValue,
                        style: const TextStyle(
                          color: Colors.black, // Text color
                          fontWeight: FontWeight.bold, // Bold text
                          fontSize: 30.0, // Font size
                        ),
                      ),
                      const SizedBox(
                        height: 160,
                      ),
                      const Text(
                        "Place your bid",
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 24.0, // Font size
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            child: OutlinedButton(
                                onPressed: () async {
                                  await FireStore.updateBid(widget.vehicleId,
                                      bid_amount_1.toString(), username);
                                  setState(() {});
                                },
                                child: Text(bid_amount_1.toString())),
                          ),
                          SizedBox(
                            width: 100,
                            child: OutlinedButton(
                                onPressed: () async {
                                  await FireStore.updateBid(widget.vehicleId,
                                      bid_amount_2.toString(), username);
                                  setState(() {});
                                },
                                child: Text(bid_amount_2.toString())),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     hintText: 'Custom Bid',
            //     alignLabelWithHint: true,
            //     contentPadding: const EdgeInsets.all(10.0),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20.0),
            //       borderSide: const BorderSide(
            //         color: Colors.black, // Border color
            //       ),
            //     ),
            //     hintStyle: const TextStyle(
            //       color: Colors.blue,
            //     ),
            //     isDense: true, // Reduces the height of the TextField
            //   ),
            //   style: TextStyle(
            //     color: Colors.blue.shade900,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

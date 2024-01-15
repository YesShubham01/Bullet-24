import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/double_item_tiles.dart';
import 'package:bullet24/Pages/BuyScreen/Support%20Widget/Suggestions%20Section/suggestion_title.dart';
import 'package:bullet24/Provider/offline_data.dart';
import 'package:bullet24/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestionSection extends StatelessWidget {
  const SuggestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomPageSectionTitle(title: "Suggestions"),
        // Use FutureBuilder to handle asynchronous data fetching
        FutureBuilder<List<VehicalDetail>>(
          future: FireStore.fetchAllVehicalDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while data is being fetched
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Show an error message if there's an error
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Show a message if no data is available
              return const Text('No vehicle details available.');
            } else {
              // Display DoubleVehicalItemTile for each item in suggestionList
              List<VehicalDetail> suggestionList = snapshot.data!;
              context.read<AppData>().setCatalogue(suggestionList);

              return Column(
                children: [
                  for (int i = 0; i < suggestionList.length; i += 2)
                    DoubleVehicalItemTile(
                      firstVehical: suggestionList[i],
                      secondVehical: (i + 1 < suggestionList.length)
                          ? suggestionList[i + 1]
                          : null,
                    ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

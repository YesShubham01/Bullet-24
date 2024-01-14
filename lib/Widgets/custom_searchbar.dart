import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Provider/offline_data.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Pages/BuyScreen/Support Widget/Suggestions Section/double_item_tiles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShapeDecoration(
        color: BS_FSG_button_false_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: shadow_false,
            blurRadius: 4,
            offset: const Offset(-2, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        child: const Center(
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // Pass a specific instance or modify as needed
        close(context,
            'Default String'); // Change 'Default String' to a meaningful default value
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final appData = Provider.of<AppData>(context, listen: false);
    final searchResults = appData.getsearchCatalogue(query);

    print('Search Results: $searchResults');

    return Column(
      children: [
        for (int i = 0; i < searchResults.length; i += 2)
          DoubleVehicalItemTile(
            firstVehical: searchResults[i],
            secondVehical:
                (i + 1 < searchResults.length) ? searchResults[i + 1] : null,
          ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final appData = Provider.of<AppData>(context, listen: false);
    final suggestionList = query.isEmpty ? [] : appData.searchCatalogue(query);

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            // Pass the selected string when an item is tapped
            query = suggestionList[index];

            showResults(context);
          },
        );
      },
    );
  }
}

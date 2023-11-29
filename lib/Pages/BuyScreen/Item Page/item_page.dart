import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final VehicalDetail vehicalDetail;

  const ItemPage({Key? key, required this.vehicalDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Image of the Vehical
          Image.network(
            vehicalDetail.frontPhoto ??
                "https://www.royalenfield.com/content/dam/royal-enfield/india/motorcycles/classic-350/landing/classic-350-motorcycle.jpg",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Vehical details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicalDetail.ownerName,
                  style: const TextStyle(fontSize: 24.0),
                ),
                Text(
                  '\$${vehicalDetail.estPrice}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam nam eu nulla a. Vestibulum aliquet facilisi interdum nibh blandit Read more.....',
                  style: TextStyle(fontSize: 14.0),
                ),

                // Features
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Autopilot'),
                    ElevatedButton(
                      onPressed: () {
                        // Implement the action for the "Contact Dealer" button
                      },
                      child: const Text('Contact Dealer'),
                    ),
                  ],
                ),

                // 360° Camera
                const Center(
                  child: Text('360° Camera'),
                ),

                // See All
                const Center(
                  child: Text('See All'),
                ),
              ],
            ),
          ),

          // Vehical details (Model year.)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vehical details (Model year.)'),
                Text('Dehli, India'),
              ],
            ),
          ),

          // EMI/Loan
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('EMI/Loan'),
          ),

          // Buy Now
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement the action for the "Buy Now" button
              },
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}

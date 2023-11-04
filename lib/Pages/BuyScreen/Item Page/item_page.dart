import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
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
          // Image of the Tesla Model 3
          const Image(
            image: NetworkImage(
              'https://www.royalenfield.com/content/dam/royal-enfield/india/motorcycles/classic-350/landing/classic-350-motorcycle.jpg',
            ),
          ),

          // Car details
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Classic 350', style: TextStyle(fontSize: 24.0)),
                Text('Rs. 18,00,000.00', style: TextStyle(fontSize: 16.0)),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam nam eu nulla a. Vestibulum aliquet facilisi interdum nibh blandit Read more.....',
                    style: TextStyle(fontSize: 14.0)),

                // Features
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Autopilot'),
                    Text('Contact Dealer'),
                  ],
                ),

                // 360° Camera
                Center(
                  child: Text('360° Camera'),
                ),

                // See All
                Center(
                  child: Text('See All'),
                ),
              ],
            ),
          ),

          // Car details (Model year.)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Car details (Model year.)'),
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
              onPressed: () {},
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}

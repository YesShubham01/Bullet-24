import 'dart:async';

import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  final VehicalDetail vehicalDetail;

  const ItemPage({Key? key, required this.vehicalDetail}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Set up a timer to automatically scroll every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String defaultPhotoUrl =
        "https://firebasestorage.googleapis.com/v0/b/bullet-24.appspot.com/o/images%2F2023-11-28%2023%3A42%3A40.316287.png?alt=media&token=f5e769bc-d076-4548-a08c-b97b106d19ea";
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.vehicalDetail.model.toString()), // Use model name in title
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Implement back button
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
            ),
            onPressed: () {
              // Implement the action for the notifications icon
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView for better scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image of the Vehicle
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: // Horizontal scrollable photos
                    GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      // Swipe right
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    } else if (details.primaryVelocity! < 0) {
                      // Swipe left
                      if (_currentPage < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    }
                  },
                  child: SizedBox(
                    height: 200,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      children: [
                        Image.network(
                          widget.vehicalDetail.sidePhoto ?? defaultPhotoUrl,
                          key: Key(widget.vehicalDetail.sidePhoto ??
                              defaultPhotoUrl),
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          widget.vehicalDetail.rearPhoto ?? defaultPhotoUrl,
                          key: Key(widget.vehicalDetail.rearPhoto ??
                              defaultPhotoUrl),
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          widget.vehicalDetail.frontPhoto ?? defaultPhotoUrl,
                          key: Key(widget.vehicalDetail.frontPhoto ??
                              defaultPhotoUrl),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Vehicle details
              const SizedBox(height: 16.0), // Add space between sections
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Owner: ${widget.vehicalDetail.ownerName}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Price: \$${widget.vehicalDetail.estPrice}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Year of Purchase: ${widget.vehicalDetail.yearOfPurchase}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Meter Reading: ${widget.vehicalDetail.meterReading} km',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ),

              // Vehicle details (Model year.)
              const SizedBox(height: 16.0),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Vehicle details (Model year.)'),
                    ],
                  ),
                ),
              ),

              // EMI/Loan
              const SizedBox(height: 16.0),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('EMI/Loan: To be added'), // Placeholder text
                ),
              ),

              // Buy Now
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomElevatedButton(
                  ontap: () {
                    // Implement the action for the "Buy Now" button
                  },
                  text: "Buy now",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bullet24/Pages/BuyScreen/Home%20Page/homepage.dart';
import 'package:bullet24/Pages/Notification%20Page/sell_notification.dart';
import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Profile Page/profile_page.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  isNotificationNumber(String? number) {
    if (number == null) {
      return null;
    } else {
      return Text(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    String? notificationNumber =
        context.read<MyProvider>().getNotificationNumber();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bullet 24"),
        actions: <Widget>[
          IconButton(
            icon: Badge(
              label: isNotificationNumber(notificationNumber),
              child: const Icon(
                Icons.notifications,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.favorite,
            //   ),
            //   label: 'Favourite',
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: B_TNAV_COLOR,
          unselectedItemColor: B_BNAV_COLOR,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}

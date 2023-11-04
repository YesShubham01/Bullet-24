import 'package:bullet24/Pages/SellScreen/Home%20Page/seller_homepage.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getMainContent() {
    if (_selectedIndex == 0) {
      return const SellerHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BS_button_active_color,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bullet 24"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
            ),
            onPressed: () {},
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
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: 'Track',
            ),
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
      body: getMainContent(),
    );
  }
}

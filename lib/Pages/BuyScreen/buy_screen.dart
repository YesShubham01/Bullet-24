import 'package:bullet24/Pages/BuyScreen/Favourite%20Page/favourite_page.dart';
import 'package:bullet24/Pages/BuyScreen/Home%20Page/homepage.dart';
import 'package:bullet24/Pages/BuyScreen/Profile%20Page/profile_page.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getMainContent() {
    if (_selectedIndex == 0) {
      return const HomePage();
    } else if (_selectedIndex == 1) {
      return const FavouritePage();
    } else {
      return const ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Icons.favorite,
              ),
              label: 'Favourite',
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
          selectedItemColor:B_TNAV_COLOR,
          unselectedItemColor: B_BNAV_COLOR,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
      body: getMainContent(),
    );
  }
}

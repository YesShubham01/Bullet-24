import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name = context.watch<MyProvider>().userDetail.name;
    String? phone = context.watch<MyProvider>().userDetail.phone;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileHeader(name, phone),
          const SizedBox(height: 16.0),
          _buildLastActivities(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(String? name, String? phone) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50.0,
          //   backgroundImage: AssetImage(
          //       'assets/profile_pic.jpg'), // Replace with your profile picture
        ),
        const SizedBox(height: 16.0),
        Text(
          name ?? "User", // Replace with the user's username
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          phone ?? "Phone Number", // Replace with the user's username
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildLastActivities() {
    return Expanded(
      child: Card(
        shadowColor: shadow_false,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Last Activities',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              _buildActivityCard('Activity 1', 'Details of activity 1'),
              _buildActivityCard('Activity 2', 'Details of activity 2'),
              _buildActivityCard('Activity 3', 'Details of activity 3'),
              // Add more activity cards as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard(String title, String details) {
    return Card(
      elevation: 4.0,
      shadowColor: shadow_false,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(details),
        onTap: () {
          // Handle the tap on the activity card
        },
      ),
    );
  }
}

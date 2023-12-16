import 'package:bullet24/Pages/ChatPage/chatpage.dart';
import 'package:bullet24/Pages/Splash%20Page/splash_page.dart';
import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:bullet24/Services/FireAuth%20Service/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name = context.watch<MyProvider>().userDetail.name;
    String? phone = context.watch<MyProvider>().userDetail.phone;
    String? link = context.watch<MyProvider>().userDetail.profileImage;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileHeader(name, phone, link),
          const SizedBox(height: 16.0),
          _buildLastActivities(context),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(String? name, String? phone, String? link) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            child: ClipOval(
              child: Image.network(
                "https://lh3.googleusercontent.com/a/ACg8ocIdoFEGLTZveA0fCkyF-ZnWB0VZ7WKZvWJhLaVGJ4DqwcwM=s96-c",
                width:
                    100, // Adjust the width to fit within the circular avatar
                height:
                    100, // Adjust the height to fit within the circular avatar
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const Text('Error loading image');
                },
              ),
            ),
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
      ),
    );
  }

  Widget _buildLastActivities(BuildContext context) {
    return Expanded(
      child: Card(
        shadowColor: shadow_false,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Last Activities',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                _buildActivityCard(
                    'Activity 1', 'Details of activity 1', context),
                _buildActivityCard(
                    'Activity 2', 'Details of activity 2', context),
                _buildActivityCard(
                    'Activity 3', 'Details of activity 3', context),
                // Add more activity cards as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard(
      String title, String details, BuildContext context) {
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
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatPage()),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 30, top: 20),
        child: OutlinedButton(
          onPressed: () {
            Authenticate.sign_out();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Signed Out!'),
                duration: Duration(seconds: 3), // Adjust the duration as needed
              ),
            );
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SplashPage()));
          },
          child: const Text(
            "Log out",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

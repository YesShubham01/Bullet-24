import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:bullet24/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MyProvider>().setNotification(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: FireStore.fetchNotifications(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // If there is an error, display an error message
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            // If there is no data or the data is empty, display a message
            return const Text('No notifications available.');
          } else {
            // If the data is available, you can use it in your UI
            List<String> notifications = snapshot.data as List<String>;

            // Build the UI with the notification list
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Your Notifications',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Divider(
                    thickness: 3,
                    color: shadow_false,
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: _buildNotificationList(notifications),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildNotificationList(List<String> notifications) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        // Split the notification into words
        List<String> words = notification.split(' ');

        // Take the first two words as the title
        String title =
            words.length >= 2 ? '${words[0]} ${words[1]}' : notification;
        String content = words.length >= 2 ? words.skip(2).join(' ') : '';

        return ThemedNotificationTile(
          title: title,
          content: content,
          onTap: () {
            // Handle notification tap
          },
        );
      },
    );
  }
}

class ThemedNotificationTile extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;

  const ThemedNotificationTile({
    required this.title,
    required this.content,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: shadow_false,
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

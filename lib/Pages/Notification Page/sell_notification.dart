import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'content': 'You have a new message from John Doe.',
    },
    {
      'title': 'Reminder',
      'content': 'Don\'t forget to submit your documents.',
    },
    // Add more notifications as needed
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
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
              child: _buildNotificationList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ThemedNotificationTile(
          title: notification['title']!,
          content: notification['content']!,
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

import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Example notification data
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'New Job Opportunity',
      'description': 'Tech Innovators is hiring a Software Developer.',
      'timestamp': '10:30 AM',
      'isRead': false,
    },
    {
      'title': 'Application Update',
      'description': 'Your application for Data Scientist has been reviewed.',
      'timestamp': 'Yesterday',
      'isRead': true,
    },
    {
      'title': 'Event Reminder',
      'description': 'Tech Job Fair 2024 starts tomorrow at 6th of October.',
      'timestamp': '2 days ago',
      'isRead': false,
    },
  ];

  // Mark a notification as read
  void _markAsRead(int index) {
    setState(() {
      _notifications[index]['isRead'] = true;
    });
  }

  // Clear all notifications
  void _clearAllNotifications() {
    setState(() {
      _notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text('Notifications',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _clearAllNotifications,
            tooltip: 'Clear All',
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_off, size: 60, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No new notifications',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: !notification['isRead']
                  ? Icon(Icons.circle, size: 10, color: Colors.blue[800])
                  : null,
              title: Text(
                notification['title'],
                style: TextStyle(
                  fontWeight: !notification['isRead'] ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    notification['description'],
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification['timestamp'],
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
              onTap: () {
                if (!notification['isRead']) {
                  _markAsRead(index);
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Refresh notifications or perform another action
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
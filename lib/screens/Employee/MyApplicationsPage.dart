import 'package:flutter/material.dart';

import 'ApplicationDetails.dart';
class ApplicationsPage extends StatelessWidget {
  final List<Map<String, String>> applications = [
    {
      'title': 'Software Engineer',
      'company': 'XYZ Company',
      'status': 'Under Review',
    },
    {
      'title': 'Graphic Designer',
      'company': 'ABC Agency',
      'status': 'Accepted',
    },
    {
      'title': 'Product Manager',
      'company': 'Tech Solutions',
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text('My Applications',style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final application = applications[index];
         return Card(
            color: Colors.blueGrey,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Opacity(
              opacity: application['status'] == 'Rejected' ? 0.5 : 1.0, // Dim rejected ones
              child: ListTile(
                leading: Icon(Icons.description),
                title: Text(
                  application['title']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: application['status'] == 'Rejected' ? Colors.red[200] : Colors.white,
                  ),
                ),
                subtitle: Text(
                  '${application['company']} - Status: ${application['status']}',
                  style: TextStyle(color: Colors.white70, fontSize: 17),
                ),
                trailing: Icon(
                  application['status'] == 'Accepted'
                      ? Icons.check_circle
                      : application['status'] == 'Rejected'
                      ? Icons.cancel
                      : application['status'] == 'Canceled'
                      ? Icons.block
                      : Icons.info,
                  color: application['status'] == 'Accepted'
                      ? Colors.lightGreen
                      : application['status'] == 'Rejected'
                      ? Colors.red[600]
                      : application['status'] == 'Canceled'
                      ? Colors.orange
                      : Colors.grey[300],
                ),
                onTap: application['status'] == 'Rejected' ? null : () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 300),
                      pageBuilder: (_, __, ___) => ApplicationDetailsPage(application: application),
                      transitionsBuilder: (_, animation, __, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1, 0), // Start from right
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}




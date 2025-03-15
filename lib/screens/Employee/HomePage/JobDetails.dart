import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  final Map<String, String> job;

  JobDetailsPage({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['title']!),
        backgroundColor: Colors.blueGrey[100],
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {
              // Save job functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Job saved!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Company Logo and Job Title
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(job['logo'] ?? 'assets/default_company.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job['title']!,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      job['company']!,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Job Details
            Text(
              'Job Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DetailRow(icon: Icons.location_on, text: 'Location: ${job['location']}'),
            DetailRow(icon: Icons.work, text: 'Job Type: ${job['type'] ?? 'Full-time'}'),
            DetailRow(icon: Icons.attach_money, text: 'Salary: ${job['salary'] ?? 'Not specified'}'),
            DetailRow(icon: Icons.calendar_today, text: 'Deadline: ${job['deadline'] ?? 'Open until filled'}'),
            SizedBox(height: 20),

            // Job Description
            Text(
              'Job Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              job['description']!,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),

            // Apply Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Apply action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Application submitted!')),
                  );
                },
                child: Text('Apply Now',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Detail Row Widget
class DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const DetailRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
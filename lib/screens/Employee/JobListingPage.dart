import 'package:flutter/material.dart';
import '../../Component/JobCard.dart';
import '../../Component/JobLists.dart';
import '../Company/job_details_screen.dart';



class JobListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blueGrey[100],
      ),
      body: ListView.builder(
        itemCount: jobListings.length,
        itemBuilder: (context, index) {
          final job = jobListings[index];
          return JobCard(job: job, onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobDetailsPage(job: job)),
            );
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../Component/JobCard.dart';
import '../../../Component/JobLists.dart';
import '../JobListingPage.dart';
import 'AdvicePage.dart';
import 'EventDetailsPage.dart';
import 'EventsSection.dart';
import 'JobDetails.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          "Welcome to the Job Portal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blueGrey[50], // Light background for better contrast
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderSection(),
                        SectionDivider(),
                        UpcomingEventsSection(),
                        SectionDivider(),
                        NewJobPostingsSection(),
                        SectionDivider(),
                        FeaturedCompaniesSection(),
                        SectionDivider(),
                        CareerTipsSection(),
                        SectionDivider(),
                        TrendingCategoriesSection(),
                        SectionDivider(),
                        RecentlyViewedJobsSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// **Header Section**
class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Hello, User!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Find your dream job today!',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

// **Section Divider**
class SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Divider(color: Colors.grey[400], thickness: 1),
    );
  }
}

// **Reusable Section Wrapper**
class SectionWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionWrapper({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}

// **Upcoming Events Section (Horizontal Scrolling)**
class UpcomingEventsSection extends StatelessWidget {
  final List<Map<String, String>> events = const [
    {'title': 'Tech Job Fair 2024', 'date': 'March 15', 'location': '6th of October'},
    {'title': 'Resume Workshop', 'date': 'March 20', 'location': 'Online'},
    {'title': 'AI Conference', 'date': 'April 10', 'location': 'Nile University'},
    {'title': 'Startup Networking', 'date': 'April 25', 'location': 'Nasr city'},
    {'title': 'Freelancer Meetup', 'date': 'May 5', 'location': 'the 5th settlement'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> topEvents = events.length > 4 ? events.sublist(0, 4) : events;

    return SectionWrapper(
      title: 'Upcoming Events 📅🌟🎊',
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topEvents.length + 1, // Extra for "See All" button
              itemBuilder: (context, index) {
                if (index < topEvents.length) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: EventCard(topEvents[index]),
                  );
                } else {
                  return SeeAllButton(
                    label: "See All Events",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventsSection()), // Navigate to all events
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// **Event Card**
class EventCard extends StatelessWidget {
  final Map<String, String> event;
  const EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetailsPage(event: event)),
        );
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  event['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  '${event['date']} - ${event['location']}',
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// **See All Button**
class SeeAllButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  SeeAllButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// **New Job Postings Section (Grid View)**
class NewJobPostingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> topJobs = jobListings.take(4).toList(); // First 4 jobs

    return SectionWrapper(
      title: 'New Job Postings 🧑🏻‍💻',
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: topJobs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.99,
            ),
            itemBuilder: (context, index) => JobCard(
              job: topJobs[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobDetailsPage(job: topJobs[index])),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobListingPage()), // Navigate to all jobs
                );
              },
              child: Text("See All Jobs"),
            ),
          ),
        ],
      ),
    );
  }
}

// **Featured Companies Section**
class FeaturedCompaniesSection extends StatelessWidget {
  final List<String> companies = const ['Google', 'Microsoft', 'Amazon', 'Tesla'];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Featured Companies',
      child: Wrap(
        spacing: 10,
        children: companies.map((company) => Chip(
          label: Text(company),
          backgroundColor: Colors.blueGrey[100],
        )).toList(),
      ),
    );
  }
}

// **Career Tips Section**
class CareerTipsSection extends StatelessWidget {
  final List<Map<String, dynamic>> tips = const [
    {'title': 'How to Write a CV', 'icon': Icons.description, 'color': Colors.blue},
    {'title': 'Interview Tips', 'icon': Icons.record_voice_over, 'color': Colors.green},
    {'title': 'Job Search Strategies', 'icon': Icons.search, 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Career Advice',
      child: Column(
        children: tips.map((tip) => Column(
          children: [
            ListTile(
              leading: Icon(tip['icon'], color: tip['color']),
              title: Text(tip['title'], style: TextStyle(fontWeight: FontWeight.w500)),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CareerAdvicePage(title: tip['title'])),
              ),
            ),
            if (tip != tips.last) Divider(), // Divider between items except last one
          ],
        )).toList(),
      ),
    );
  }
}

// **Trending Job Categories Section (Horizontal Chips)**
class TrendingCategoriesSection extends StatelessWidget {
  final List<String> categories = const ['IT', 'Marketing', 'Finance', 'Healthcare', 'Engineering'];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Trending Job Categories',
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: categories.map((category) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Chip(
              label: Text(category),
              backgroundColor: Colors.blueGrey[100],
            ),
          )).toList(),
        ),
      ),
    );
  }
}

// **Recently Viewed Jobs Section**
class RecentlyViewedJobsSection extends StatelessWidget {
  final List<Map<String, String>> recentJobs = const [
    {'title': 'UX Designer', 'company': 'Adobe'},
    {'title': 'Data Scientist', 'company': 'Facebook'},
    {'title': 'Software Engineer', 'company': 'Google'},
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Recently Viewed Jobs',
      child: Column(
        children: recentJobs.map((job) => Card(
          child: ListTile(
            leading: Icon(Icons.history, color: Colors.blueGrey[800]),
            title: Text(job['title']!, style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(job['company']!),
          ),
        )).toList(),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../widgets/custom_drawer_widget.dart';

class JobHomePage extends StatelessWidget {
  const JobHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 13),
            child: Text(
              "Jobs",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          toolbarHeight: 80.0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 13),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Suggested Jobs',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const JobCard(),
            const SizedBox(height: 10),
            const JobCard(),
            const SizedBox(height: 10),
            const JobCard(),
            const SizedBox(height: 10),
            const JobCard(),
            const SizedBox(height: 10),
            const JobCard(),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.withOpacity(0.1),
                child: const Text('B',
                    style: TextStyle(color: Colors.blue, fontSize: 20)),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('UI Designer',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('BrioSoft Solutions, New York, USA',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          const Text('\$42k - \$48k / month',
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Row(
            children: [
              JobTag(label: 'Full-Time'),
              JobTag(label: 'Remote'),
              JobTag(label: 'Internship'),
            ],
          ),
        ],
      ),
    );
  }
}

class JobTag extends StatelessWidget {
  final String label;

  const JobTag({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}

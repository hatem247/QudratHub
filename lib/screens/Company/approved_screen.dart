import 'package:flutter/material.dart';

import '../../widgets/custom_drawer_widget.dart';

class ApprovedScreen extends StatefulWidget {
  @override
  _ApprovedScreenState createState() => _ApprovedScreenState();
}

class _ApprovedScreenState extends State<ApprovedScreen> {
  final List<Map<String, String>> employees = [
    {
      "name": "Shaidul Islam",
      "role": "Designer",
      "status": "P",
      "time": "2h 20m",
    },
    {
      "name": "Ibne Riead",
      "role": "Designer",
      "status": "A",
      "time": "On time",
    },
    {
      "name": "Mehedii Mohammad",
      "role": "Designer",
      "status": "H/D",
      "time": "3h 32m",
    },
    {
      "name": "Emily",
      "role": "Designer",
      "status": "H",
      "time": "On time",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
              "Approved",
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return _buildEmployeeCard(employees[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard(Map<String, String> employee) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.blueAccent),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(employee["name"]!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(employee["role"]!,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("            In Time",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Out Time",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.black, thickness: 0.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("17 Aug 2021"),
                      Text("09:00 AM"),
                      Text("05:00 PM"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 5),
                Text("Approved"),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

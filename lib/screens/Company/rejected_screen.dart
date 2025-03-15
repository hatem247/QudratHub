import 'package:flutter/material.dart';

import '../../widgets/custom_drawer_widget.dart';

class EmployeeRejectedScreen extends StatefulWidget {
  @override
  _EmployeeRejectedScreenState createState() => _EmployeeRejectedScreenState();
}

class _EmployeeRejectedScreenState extends State<EmployeeRejectedScreen> {
  final List<Map<String, String>> employees = [
    {
      "name": "Shaidul Islam",
      "role": "Designer",
      "status": "R",
      "time": "09:00 AM - 05:00 PM",
    },
    {
      "name": "Mehedii Mohammad",
      "role": "Designer",
      "status": "R",
      "time": "09:00 AM - 05:30 PM",
    },
    {
      "name": "Ibne Riead",
      "role": "Designer",
      "status": "R",
      "time": "00:00 AM - 00:00 PM",
    },
    {
      "name": "Mehedii Mohammad",
      "role": "Designer",
      "status": "R",
      "time": "09:00 AM - 05:30 PM",
    },
    {
      "name": "Ibne Riead",
      "role": "Designer",
      "status": "R",
      "time": "00:00 AM - 00:00 PM",
    },
    {
      "name": "Mehedii Mohammad",
      "role": "Designer",
      "status": "R",
      "time": "09:00 AM - 05:30 PM",
    },
    {
      "name": "Ibne Riead",
      "role": "Designer",
      "status": "R",
      "time": "00:00 AM - 00:00 PM",
    },
  ];

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
            child: Text("Rejected Requests",
                style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.blue,
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
                const CircleAvatar(backgroundColor: Colors.blue),
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
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("In Time",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Out Time",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Divider(color: Colors.black, thickness: 0.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("17 Aug 2021"),
                      Text(employee["time"]!.split(" - ")[0]),
                      Text(employee["time"]!.split(" - ")[1]),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.cancel, color: Colors.red),
                      SizedBox(width: 5),
                      Text("Rejected"),
                    ],
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

import 'package:flutter/material.dart';
import '../../widgets/custom_drawer_widget.dart';
import 'add_job_screen.dart';
import 'approved_screen.dart';
import 'job_list_screen.dart';
import 'pending_screen.dart';
import 'rejected_screen.dart';
import 'requests_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: [
          _buildCustomAppBar(screenHeight),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: GridView(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.5,
                    ),
                    children: [
                      InkWell(
                        child: _buildGridItem("Add Job", Icons.add_box, Colors.blue),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddJobScreen(),
                            )),
                      ),
                      InkWell(
                        child: _buildGridItem("Jobs", Icons.work, Colors.green),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const JobHomePage(),
                            )),
                      ),
                      InkWell(
                        child: _buildGridItem("Requests", Icons.notifications_active, Colors.orange),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EmployeeAttendanceScreen(),
                            )),
                      ),
                      InkWell(
                        child: _buildGridItem("Approved", Icons.check_circle, Colors.purple),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ApprovedScreen(),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 3,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildListItem("Job Listings", Icons.list, Colors.purple, context, const JobHomePage()),
                      _buildListItem("Pending Requests", Icons.hourglass_empty, Colors.orange, context,  EmployeePendingScreen()),
                      _buildListItem("Approved Requests", Icons.check_circle, Colors.green, context,  ApprovedScreen()),
                      _buildListItem("Rejected Requests", Icons.cancel, Colors.red, context, EmployeeRejectedScreen()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar(double screenHeight) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.16,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                const Column(
                  children: [
                    Text("Company ", style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text("Management", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
                Stack(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.notifications, color: Colors.white, size: 28),
                        onPressed: () {}),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: screenHeight * 0.012,
                        width: screenHeight * 0.012,
                        decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(String title, IconData icon, Color borderColor) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: borderColor, width: 3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: borderColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon, Color color, BuildContext context, Widget screen) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: 3)),
        ),
        child: ListTile(
          leading: Icon(icon, size: 30, color: color),
          title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        ),
      ),
    );
  }
}//2

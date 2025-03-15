import 'package:flutter/material.dart';
import '../screens/Company/approved_screen.dart';
import '../screens/Company/company_profile_screen.dart';
import '../screens/Company/home_screen.dart';
import '../screens/Company/logout_screen.dart';
import '../screens/Company/requests_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Shaidul Islam"),
            accountEmail: Text("Admin"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.blueAccent),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          _buildDrawerItem(Icons.home, "Home Page", context),
          _buildDrawerItem(Icons.business, "Company Profile", context),
          _buildDrawerItem(Icons.notifications_active, "Requests", context),
          _buildDrawerItem(Icons.logout, "Log Out", context),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        if (title == 'Home Page') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        } else if (title == 'Company Profile') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CompanyProfilePage(),
              ));
        } else if (title == 'Requests') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmployeeAttendanceScreen(),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogoutPage(),
              ));
        }
      },
    );
  }
}

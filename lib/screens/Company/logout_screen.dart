import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'signin_screen.dart';

class JobHomePage extends StatelessWidget {
  const JobHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LogoutPage()),
            );
          },
          child: const Text('Go to Logout Page'),
        ),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.logOut, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text('Oh no! You’re leaving...\nAre you sure?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(20, 50),
                side: const BorderSide(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
              child: const Text('Yes, Log Me Out',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}

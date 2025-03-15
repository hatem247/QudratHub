import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final Map<String, String> event;

  EventDetailsPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event['title']!),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Share event functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Event shared!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                event['banner'] ?? 'assets/default_event_banner.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Event Title and Details
            Text(
              event['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "📅 ${event['date']} - 📍 ${event['location']}",
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            SizedBox(height: 16),

            // Organizer and Collaborator
            Text(
              "Organized by: ${event['organizer'] ?? 'Unknown'}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            if (event['collaborator'] != null)
              Text(
                "In collaboration with: ${event['collaborator']}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            SizedBox(height: 16),

            // Event Description
            Text(
              event['description'] ?? "No description available.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),

            // Registration Form
            RegistrationForm(),
          ],
        ),
      ),
    );
  }
}

// Registration Form Widget
class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registered successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Full Name"),
            validator: (value) => value!.isEmpty ? "Enter your name" : null,
            onSaved: (value) => name = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            validator: (value) => value!.isEmpty ? "Enter your email" : null,
            onSaved: (value) => email = value!,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: submitForm,
            child: Text("Register",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
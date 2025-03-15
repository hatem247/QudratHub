import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/CompanyProvider.dart';

class CompanyUpdatePasswordScreen extends StatefulWidget {
  @override
  _CompanyUpdatePasswordScreenState createState() => _CompanyUpdatePasswordScreenState();
}

class _CompanyUpdatePasswordScreenState extends State<CompanyUpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final companyProvider = Provider.of<CompanyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Password (Company)"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your email and new password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty ? "Please enter your email" : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "New Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) => value == null || value.length < 6 ? "Password must be at least 6 characters long" : null,
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: companyProvider.isLoading
                      ? null
                      : () async {
                    if (_formKey.currentState!.validate()) {
                      await companyProvider.updatePassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      if (companyProvider.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(companyProvider.errorMessage!),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Password updated successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        emailController.clear();
                        passwordController.clear();
                      }
                    }
                  },
                  child: companyProvider.isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Update Password"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
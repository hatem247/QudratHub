import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:qudrathub/Providers/CompanyProvider.dart';
import 'signin_screen.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? _taxRecord;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPhoneController = TextEditingController();
  final TextEditingController _companyPasswordController =
      TextEditingController();
  final TextEditingController _adminNameController = TextEditingController();
  final TextEditingController _adminEmailController = TextEditingController();
  final TextEditingController _adminPhoneController = TextEditingController();
  final TextEditingController _adminpasswordController = TextEditingController();
  final TextEditingController _deputyNameController = TextEditingController();
  final TextEditingController _deputyEmailController = TextEditingController();
  final TextEditingController _deputyPhoneController = TextEditingController();
  final TextEditingController _deputypasswordController = TextEditingController();
  final TextEditingController taxrecord = TextEditingController();

  Future<void> _pickTaxRecord() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _taxRecord = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final CompanyProvider providerObject =
    Provider.of<CompanyProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Sign up now to begin an amazing journey",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildTextField(
                        _companyNameController, "Company Name", Icons.business),
                    _buildTextField(
                        _companyEmailController, "Company Email", Icons.email),
                    _buildTextField(
                        _companyPhoneController, "Company Phone", Icons.phone),
                    _buildTextField(_companyPasswordController,
                        "Company Password", Icons.lock,
                        isPassword: true),
                    _buildTextField(
                        _adminNameController, "Admin Name", Icons.person),
                    _buildTextField(
                        _adminEmailController, "Admin Email", Icons.email),
                    _buildTextField(
                        _adminpasswordController, "Admin Password", Icons.phone),
                    _buildTextField(
                        _adminPhoneController, "Admin Phone", Icons.phone),

                    _buildTextField(_deputyNameController, "Deputy Director Name",
                        Icons.person),
                    _buildTextField(_deputyEmailController,
                        "Deputy Director Email", Icons.email),
                    _buildTextField(_deputypasswordController,
                        "Deputy Director Password", Icons.email),
                    _buildTextField(_deputyPhoneController,
                        "Deputy Director Phone", Icons.phone),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _pickTaxRecord,
                      icon: const Icon(Icons.upload_file, color: Colors.white),
                      label: const Text("Upload Tax Record"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _taxRecord != null ? "File Selected" : "No file selected",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await providerObject.registerCompany(
                            email: _companyEmailController.text,
                            password: _companyPasswordController.text,
                            name: _companyNameController.text,
                            phone: _companyPhoneController.text,
                            adminName: _adminNameController.text,
                            adminEmail: _adminEmailController.text,
                              adminPassword: _adminpasswordController.text,
                            adminPhone: _adminPhoneController.text,
                            directorName: _deputyNameController.text,
                            directorEmail: _deputyEmailController.text,
                            directorPassword: _deputypasswordController.text,
                            directorPhone: _deputyPhoneController.text,
                            taxRecord: taxrecord.text
                          );
                          if (providerObject.company != null) {
                            print(providerObject.company);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 100),
                      ),
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

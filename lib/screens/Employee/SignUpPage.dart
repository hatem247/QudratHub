import 'package:flutter/material.dart';

import '../../main.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});

   @override
   State<RegisterPage> createState() => _RegisterPageState();
 }
 final TextEditingController _nameController = TextEditingController();
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _anotherEmailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
 final TextEditingController _phoneNumberController = TextEditingController();
 final TextEditingController _ageController = TextEditingController();
 final TextEditingController _genderController = TextEditingController();
 final TextEditingController _nationalCardFileController = TextEditingController();
 final TextEditingController _statementController = TextEditingController();
 final TextEditingController _socialSolidarityController = TextEditingController();

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 bool _isPasswordVisible = false;
 class _RegisterPageState extends State<RegisterPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.blueGrey[100],
       body:
       SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.all(16),
           child: Form(
             key: _formKey,
             child: Padding(
               padding: const EdgeInsets.only(top: 5),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 60),
                   SizedBox(height: 20),
                   Container(

                     child: Center(
                       child: Text(
                         'Sign Up',
                         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                       ),
                     ),
                   ),
                   Container(

                     child: Center(
                       child: Text(
                         'Here your dreams will come true',
                         style: TextStyle(fontSize: 16, color: Colors.black),
                       ),
                     ),
                   ),
                   SizedBox(height: 20),
                   TextFormField(
                     controller: _nameController,
                     decoration: InputDecoration(
                       labelText: 'Name',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Full Name is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _emailController,
                     decoration: InputDecoration(
                       labelText: 'Email',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Email is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _anotherEmailController,
                     decoration: InputDecoration(
                       labelText: 'Another Email',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     cursorColor: Colors.white,
                     controller: _passwordController,
                     obscureText: !_isPasswordVisible,
                     decoration: InputDecoration(
                       labelText: 'Password',
                       prefixIcon: Icon(Icons.lock),
                       suffixIcon: IconButton(
                         icon: Icon(
                           _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                         ),
                         onPressed: () {
                           setState(() {
                             _isPasswordVisible = !_isPasswordVisible;
                           });
                         },
                       ),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Password is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _phoneNumberController,
                     decoration: InputDecoration(
                       labelText: 'Phone Number',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Phone Number is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _ageController,
                     decoration: InputDecoration(
                       labelText: 'Age',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Age is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _emailController,
                     decoration: InputDecoration(
                       labelText: 'Gender',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Gender is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _emailController,
                     decoration: InputDecoration(
                       labelText: 'National Card File',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'National Card File is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _emailController,
                     decoration: InputDecoration(
                       labelText: 'Statement',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Statement is required' : null,
                   ),
                   SizedBox(height: 10),
                   TextFormField(
                     controller: _passwordController,
                     decoration: InputDecoration(
                       labelText: 'Social Solidarity',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                     ),
                     validator: (value) => value!.isEmpty ? 'Social Solidarity is required' : null,
                   ),
                   SizedBox(height: 10),

                   Container(

                     width: 250,
                     height: 50,
                     decoration: BoxDecoration(
                       color: Colors.blueGrey,
                       borderRadius: BorderRadius.circular(30),

                     ), child: ElevatedButton(
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBottomNavBar(),));
                     },
                     child: Text(
                       ' Sign up',
                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                     ),

                   ),
                   ),

                   SizedBox(height: 10),
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'Already have an account?',

                           ),
                           GestureDetector(
                             onTap: () {
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => Signin(),
                                   ));
                             },
                             child: Text(
                               ' Sign in',
                               style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
                             ),
                           ),


                         ],
                       ),
                       SizedBox(height: 20,),

                     ],
                   ),
                   SizedBox(height: 30), // Added space to prevent content from being blocked by the keyboard
                 ],
               ),
             ),
           ),
         ),
       ),

     );
   }
 }


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_sangamner/homepage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  // Method to create a user account
  // Method to create a user account and store additional user information in Firestore
void createAccount() async {
  // Retrieve user input
  String name = nameController.text.trim();
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  String cpassword = cpasswordController.text.trim();

  if (name.isEmpty || email.isEmpty || password.isEmpty || cpassword.isEmpty) {
    // Log an error if any field is empty
    log("Please fill all the details");
  } else if (password != cpassword) {
    // Log an error if passwords don't match
    log("Passwords do not match");
  } else {
    try {
      // Attempt to create a user account
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create a map with user data
      Map<String, dynamic> userData = {
        'name': name,
        'email': email,
        'password': password,
        // Add more user data fields as needed
      };

      // Store user data in Firestore using user's UID as document ID
      await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set(userData);

      // Navigate to the homepage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homescreen()),
      );

      // Show a dialog or snackbar indicating successful account creation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );
    } catch (ex) {
      // Log error message if user creation or data saving fails
      log("Error creating user: $ex");
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome to Community',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 54,
                width: 329,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: buildInputField(
                  labelText: 'Name',
                  prefixIcon: Icons.person,
                  controller: nameController,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 54,
                width: 329,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: buildInputField(
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  controller: emailController,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 54,
                width: 329,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: buildInputField(
                  labelText: 'Set Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  controller: passwordController,
                ),
              ),
              const SizedBox(height: 30),
              Container(  
                height: 54,
                width: 329,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: buildInputField(
                  labelText: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  controller: cpasswordController,
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: createAccount,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.yellow,
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for building input fields
  Widget buildInputField({
    required String labelText,
    required IconData prefixIcon,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: InputBorder.none,
        ),
        obscureText: obscureText,
      ),
    );
  }
}

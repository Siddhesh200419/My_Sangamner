  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:my_sangamner/forget_pass.dart';
  import 'package:my_sangamner/homelogin.dart';
  import 'package:my_sangamner/homepage.dart';
  import 'package:my_sangamner/pageconstruct.dart';
  import 'dart:developer';

  class LoginScreen extends StatefulWidget {
    const LoginScreen({Key? key}) : super(key: key);

    @override
    _LoginScreenState createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email == "" || password == "") {
        log("please fill also ");
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (userCredential != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
          }
        } on FirebaseAuthException catch (ex) {
          // Show a Snackbar with the exception message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(ex.message ?? 'An error occurred'),
            ),
          );
        }
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView( // Wrap your Column with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                const Text(
                  'Welcome Back !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
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
                SizedBox(height: 40),
                Container(
                  height: 54,
                  width: 329,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: buildInputField(
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle( fontSize: 16,color:Color.fromARGB(255, 255, 127, 68),), // Adjust text color as needed
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Call the login method when the button is pressed
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.cabin(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildInputField({
      required String labelText,
      required IconData prefixIcon,
      bool obscureText = false,
      required TextEditingController controller,
    }) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
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

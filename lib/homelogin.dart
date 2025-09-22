import 'package:flutter/gestures.dart'; // Import gesture recognizer
import 'package:flutter/material.dart';
import 'package:my_sangamner/loginscreen.dart';
import 'signupscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set background color to white
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/sign-up.gif',
                  width: 800,
                  height: 500,
               
                ),
              ),
              const SizedBox(height: 5), // Add spacing
              SizedBox(
                width: 311,
                height: 51,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your sign-up logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, // Button background color
                    textStyle: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 20,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('  Sign Up   ',
                          style: GoogleFonts.roboto(fontSize: 20, color: Colors.black)),
                      Icon(Icons.arrow_forward, color: Colors.black),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add spacing
              RichText(
                text: TextSpan(
                  text: 'Already registered? ',
                  style: GoogleFonts.cabin(
                    color: Colors.black, // Text color
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 255, 127, 68), // Custom color for Login text
                        decoration: TextDecoration.none,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Adding Login page here 
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
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
}

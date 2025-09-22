import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:flutter/material.dart';
import 'package:my_sangamner/firebase_options.dart';
import 'package:my_sangamner/homelogin.dart';
import 'package:my_sangamner/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => (FirebaseAuth.instance.currentUser != null)
          ? const Homescreen()
          : const MyHomePage(),
    },
  ));
}
//connect device please and test this code
//Ok
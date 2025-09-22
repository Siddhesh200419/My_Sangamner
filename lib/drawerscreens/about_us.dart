import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/main-logo.png', // Replace 'your_image.png' with your image path
                  width: 200,
                  height: 200, // Adjust height as needed
                ),
              ),
            ),
            SizedBox(
                height: 05), // Add some space between the image and the text
            Text(
              'We\'re second-year computer engineering students from Amrutvahini College of Engineering. We created this project as part of our Project-Based Learning course. \n Our goal was to build a platform where people from Sangamner and nearby areas could come together and share information. We wanted to support local businesses and highlight the beautiful places in our city, while also providing a space for people to showcase their talents, whether it\'s singing, dancing, or any other skill they\'re passionate about. \nBy collaborating and implementing new ideas, we developed this project with the vision to enhance Sangamner and its surrounding areas while gaining valuable experience. Join us in our journey to make our community vibrant and to promote local talent and tourist attractions!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

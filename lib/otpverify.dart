import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_sangamner/homepage.dart';
import 'package:my_sangamner/pageconstruct.dart';
class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Mobile Verification',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Enter OTP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 62,
                    height: 61,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 1, 1, 1)),
                      color: const Color.fromARGB(255, 216, 216, 216).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add your verification logic here
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Homescreen()), 
                     );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.yellow,
                
              ),
              child: Text('Verify', style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                // Add your resend OTP logic here

              },
              child: Text('Resend', style: TextStyle(fontSize: 16, color:Color.fromARGB(255, 255, 113, 52))),
            ),
          ],
        ),
      ),
    );
  }
}

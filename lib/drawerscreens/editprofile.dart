import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'package:my_sangamner/pageconstruct.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _profileImage;

  // Method to open the gallery and select an image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _pickImage, // Call _pickImage method when the profile icon is tapped
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/images/john-doe.jpg')
                            as ImageProvider,
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
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 54,
                  width: 329,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: buildInputField(
                    labelText: 'Username',
                    prefixIcon: Icons.person,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 54,
                  width: 329,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: buildInputField(
                    labelText: 'Name',
                    prefixIcon: Icons.face,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 54,
                  width: 329,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: buildInputField(
                    labelText: 'Current Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 54,
                  width: 329,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: buildInputField(
                    labelText: 'New Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Add your save changes logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UnderConstructionPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text('Save Changes', style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required String labelText,
    required IconData prefixIcon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
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

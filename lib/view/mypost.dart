import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Text(
                  'Add your post',
                  style: TextStyle(fontSize: 18.0),
                ),
                Divider(),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Iconsax.gallery),
                          onPressed: () {
                            // Handle gallery button press
                          },
                        ),
                        Text('Gallery'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Iconsax.video),
                          onPressed: () {
                            // Handle video button press
                          },
                        ),
                        Text('Video'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Iconsax.pen_add),
                          onPressed: () {
                            // Handle post button press
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                        Text('Post'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Divider(),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/error.png', width: 250,), 
                SizedBox(height: 16.0),
                Text(
                  'No Post Found!',
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

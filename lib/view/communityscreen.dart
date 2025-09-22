import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_sangamner/view/mypost.dart';

class Communityscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Community Forum'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'My Post'),
              Tab(text: 'City'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyPostScreen(),
            CityPage(),
          ],
        ),
      ),
    );
  }
}


class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4, // Number of posts
      itemBuilder: (context, index) {
        return PostWidget();
      },
    );
  }
}

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), // Circular border
        border: Border.all(color: const Color.fromARGB(255, 210, 210, 210), width: 1.0),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/john-doe.jpg'),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@Johnd24',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('24 Mar 2024, 11:13 PM'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Image.asset('assets/images/banyan1.jpg'),
          const SizedBox(height: 8.0),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              IconButton(
                icon: const Icon(Iconsax.heart),
                onPressed: () {
                  // Handle like button press
                },
              ),
              IconButton(
                icon: const Icon(Iconsax.save_24),
                onPressed: () {
                  // Handle save button press
                },
              ),
              IconButton(
                icon: const Icon(Iconsax.flag),
                onPressed: () {
                  // Handle dislike button press
                },
              ),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {
                  // Handle add comment button press
                  // Show keyboard
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

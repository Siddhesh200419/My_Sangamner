import 'package:flutter/material.dart';

class ExploreContent extends StatelessWidget {
  final String category;

  const ExploreContent({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Details'),
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming there are 10 education details to show
        itemBuilder: (context, index) {
        
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: Image
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey, // Placeholder color until image is loaded
                    // You can use a real image here
                    image: DecorationImage(
                      image: AssetImage('path_to_your_image'), // Replace 'path_to_your_image' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16), // Spacer between image and text
                // Right side: Business name and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Short description goes here.need to provide a brief overview of the education details.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

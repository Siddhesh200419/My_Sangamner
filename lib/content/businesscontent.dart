import 'package:flutter/material.dart';

class BusinessContent extends StatelessWidget {
  final String category;

  const BusinessContent({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Details'),
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming only one business detail is shown at a time
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
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
                          image: NetworkImage('https://content.jdmagicbox.com/comp/sangamner/f2/9999px241.x241.210306113112.h8f2/catalogue/new-sangamner-medical-sangamner-sangamner-chemists-pcfr6nmbz3.jpg?clr=f'), 
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
                            'Short description goes here. need to provide a brief overview of the business.',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                ), // Divider between items
              ],
            ),
          );
        },
      ),
    );
  }
}

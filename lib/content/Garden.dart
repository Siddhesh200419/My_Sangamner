import 'package:flutter/material.dart';

class Gardenscreen extends StatelessWidget {
  const Gardenscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gardens'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildGardenTile(
            title: 'Nehru Garden',
            imagePath: 'assets/images/Nehrugarden.jpg',
            location: 'Ganesh Nagar, Sangamner',
          ),
          _buildGardenTile(
            title: 'Municipal Garden',
            imagePath: 'assets/images/Munciplegarden.jpg',
            location: 'Vidhyanagar, Sangamner',
          ),
          _buildGardenTile(
            title: 'Sangamner Nagarpalika Udyan',
            imagePath: 'assets/images/Sangamnergarden.jpg',
            location: 'Sangamner City',
          ),
          _buildGardenTile(
            title: 'Gangamai Ghat',
            imagePath: 'assets/images/Gangamaighat.jpg',
            location: 'Sangamner City',
          ),
          // Add more ListTiles for additional gardens
        ],
      ),
    );
  }

  Widget _buildGardenTile({
    required String title,
    required String imagePath,
    required String location,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Add functionality to navigate or show more information about the garden
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Location: $location',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

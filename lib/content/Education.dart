import 'package:flutter/material.dart';

class Educationscreen extends StatelessWidget {
  const Educationscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          _buildEducationTile(
            context,
            'Amrutvahini College of Engineering, Sangamner',
            'assets/images/avcoe-logo.png',
            '4.5',
          ),
          _buildEducationTile(
            context,
            'D.J. Malpani Group of Institutions, Sangamner',
            'assets/images/dj_malpani1.png',
            '4.2',
          ),
          _buildEducationTile(
            context,
            'Sahyadri Junior College, Sangamner',
            'assets/images/sahyadri.png',
            '4.0',
          ),
          _buildEducationTile(
            context,
            'SMBT Dental College, Sangamner',
            'assets/images/smbt.png',
            '4.8',
          ),
          _buildEducationTile(
            context,
            'Shramik Junior College, Sangamner',
            'assets/images/shikshan.png',
            '4.3',
          ),
          _buildEducationTile(
            context,
            'Ithape Institute, Sangamner',
            'assets/images/ithape1.jpg',
            '4.1',
          ),
          _buildEducationTile(
            context,
            'Amrutvahini Sheti and Shikshan Vikas Sanstha, Sangamner',
            'assets/images/avcoe-logo.png',
            '4.1',
          ),
          // Add more ListTiles for additional education institutes
        ],
      ),
    );
  }

  Widget _buildEducationTile(
      BuildContext context, String title, String logoPath, String rating) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 60,
          height: 60,
          child: Image.asset(
            logoPath,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            SizedBox(width: 5),
            Text(rating),
          ],
        ),
        // Add trailing widget if needed
        // trailing: IconButton(
        //   icon: Icon(Icons.favorite),
        //   onPressed: () {},
        // ),
      ),
    );
  }
}

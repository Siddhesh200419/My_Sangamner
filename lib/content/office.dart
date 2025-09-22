import 'package:flutter/material.dart';

class Officescreen extends StatelessWidget {
  const Officescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offices'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          _buildOfficeTile(
            context,
            'Tahasil karyalay Sangamner',
            'Address: Punjabi Colony, Sangamner',
            'Contact: 123-456-7890',
          ),
          _buildOfficeTile(
            context,
            'PWD Office',
            'Address: Indiranagar, Sangamner',
            'Contact: 987-654-3210',
          ),
          _buildOfficeTile(
            context,
            'New Excise Office Sangamner',
            'Address: Punjabi Colony, Sangamner',
            'Contact: 456-789-0123',
          ),
          _buildOfficeTile(
            context,
            'Adhar Card Kendra, Sangamner',
            'Address: Lane no.4, Ganesh Nagar, Sangamner',
            'Contact: 789-012-3456',
          ),
          _buildOfficeTile(
            context,
            'Yashvantrao Chavhan Central Administrative Office Building',
            'Address: Navin Nagar Rd, Sangamner',
            'Contact: 321-654-9870',
          ),
          _buildOfficeTile(
            context,
            'Talathi karyalay Sangamner Budhruk',
            'Address: Rajasthan chouk ,Main Rd, Sangamner',
            'Contact: 654-321-0987',
          ),
          _buildOfficeTile(
            context,
            'Prant Tahasil Office',
            'Address: Navin Nagar Rd, Sangamner',
            'Contact: 012-345-6789',
          ),
          _buildOfficeTile(
            context,
            'Panchayat Samiti Sangamner',
            'Address: Rajapur, Sangamner',
            'Contact: 234-567-8901',
          ),
          _buildOfficeTile(
            context,
            'Sangamner Municipal Corporation',
            'Address: Rangargalli, Sangamner',
            'Contact: 345-678-9012',
          ),
          _buildOfficeTile(
            context,
            'Forest Subdivision Office',
            'Address: Sangamner Kh, Sangamner',
            'Contact: 678-901-2345',
          ),
          _buildOfficeTile(
            context,
            'Kisan Seva Suvidha Kendra',
            'Address: Navin Nagar Rd , Sangamner',
            'Contact: 901-234-5678',
          ),
          _buildOfficeTile(
            context,
            'Setu Suvidha Kendra',
            'Address: Punjabi Colony, Sangamner',
            'Contact: 123-456-7890',
          ),
          _buildOfficeTile(
            context,
            'Sangamner City Police Station',
            'Address: Punjabi Colony, Sangamner',
            'Contact: 100',
          ),
          _buildOfficeTile(
            context,
            'Sangamner Post Office',
            'Address: Navin Nagar Rd, Sangamner',
            'Contact: 456-789-0123',
          ),
          _buildOfficeTile(
            context,
            'Sangamner Court',
            'Address: Punjabi Colony, Sangamner',
            'Contact: 789-012-3456',
          ),
          _buildOfficeTile(
            context,
            'Bhumi Abhi Lekh Office',
            'Address: Navin Nagar Rd, Sangamner',
            'Contact: 321-654-9870',
          ),
          _buildOfficeTile(
            context,
            'MSEB Office Sangamner',
            'Address: Pune-Nashik Hwy,Near Prant Tahasil Office, Sangamner',
            'Contact: 654-321-0987',
          ),
          _buildOfficeTile(
            context,
            'Ghulewadi Police Quarters',
            'Address: Sangamner',
            'Contact: 012-345-6789',
          ),
          _buildOfficeTile(
            context,
            'Subtreasury Office',
            'Address: Punjabi Colony, Sangamner',
            'Contact: 234-567-8901',
          ),
          _buildOfficeTile(
            context,
            'Adhar Enrolment Centre',
            'Address: Police Colony, Sangamner',
            'Contact: 345-678-9012',
          ),
        ],
      ),
    );
  }

  Widget _buildOfficeTile(
      BuildContext context, String title, String address, String contact) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              address,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              contact,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

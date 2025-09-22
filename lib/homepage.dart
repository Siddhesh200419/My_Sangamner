import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_sangamner/content/Education.dart';
import 'package:my_sangamner/content/Garden.dart';
import 'package:my_sangamner/content/explorecontent.dart';
import 'package:my_sangamner/content/office.dart';
import 'package:my_sangamner/content/touristscreen.dart';
import 'package:my_sangamner/drawerscreens/about_us.dart';
import 'package:my_sangamner/drawerscreens/editprofile.dart';
import 'package:my_sangamner/drawerscreens/seller_onboard.dart';
import 'package:my_sangamner/homelogin.dart';
import 'package:my_sangamner/pageconstruct.dart';
import 'package:my_sangamner/view/businessscreen.dart';
import 'package:my_sangamner/view/communityscreen.dart';
import 'package:my_sangamner/content/explorecontent.dart';
import 'package:my_sangamner/view/touristscreen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _carouselIndex = 0; // Variable to track carousel index
  int _navIndex = 0; // Variable to track bottom navigation index

  FirebaseFirestore _firestore=FirebaseFirestore.instance;

void logout  () async
{
   await FirebaseAuth.instance.signOut();
   Navigator.popUntil(context, (route) => route.isFirst);
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
}
  // List Images for trending Story
  List<String> trendingImages = [
    'assets/images/pem2.jpg',
    'assets/images/Gangamaighat.jpg',
    'assets/images/Tamkada1.jpg',
  ];
  // List of advertisement banners (images)
  List<String> advertisementImages = [
    'assets/images/advtbanner.png',
    'assets/images/advtbanner2.png',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg',
    'assets/images/banner5.jpg',
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: _getBody(_navIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) {
          setState(() {
            _navIndex = newIndex;
          });
        },
        currentIndex: _navIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromARGB(255, 136, 136, 136),
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.people4), label: 'Community Forum'),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.shop4), label: 'Business Hub'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 161, 128, 253),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/john-doe.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '@johnd24',
                    style: GoogleFonts.varelaRound(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' John Doe', // Replace with user's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.edit),
              title: Text('Edit Profile'),
              onTap: () {
                // Navigate to edit profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Join As Seller'),
              onTap: () {
                // join as seller functionality
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellerOnboardingScreen()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Iconsax.info_circle),
              title: Text('About Us'),
              onTap: () {
                // Navigate to about us screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Iconsax.star),
              title: Text('Rate Us'),
              onTap: () {
                // Navigate to Playstore or rate button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnderConstructionPage()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Iconsax.logout),
              title: Text('Log Out'),
              onTap: () {
                // Implement log out functionality
                  logout();
                
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return Communityscreen();
      case 2:
        return const Businessscreen();
      default:
        return Container();
    }
  }

  Widget _buildButton(String title, IconData icon) {
    return SizedBox(
      width: 180,
      height: 50,
      child: InkWell(
        onTap: () {
          // Handle button tap
          if (title == 'Tourist Spots') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Educationscreen()),
            );
          }

          else if (title =='Education')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Educationscreen()),
            );
          }

          else if (title =='Garden')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Gardenscreen()),
            );
          }

          else if (title =='Offices')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Officescreen()),
            );
          }
          ;
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //border: Border.all(color: Colors.black),
            color: Color.fromRGBO(255, 229, 56, 1),
          ),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 18, 7, 7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          height: 110,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Open drawer
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        // Replace with user profile picture
                        backgroundImage: AssetImage('assets/images/john-doe.jpg'),
                      ),
                      SizedBox(width: 10), // Add spacing between avatar and text
                      Text(
                        'Hello, John',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Iconsax.notification5,
                    color: Color.fromARGB(112, 55, 48, 48), size: 35),
                onPressed: () {
                  print('Check notifications');
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  height: 250,
                  child: Stack(
                    children: [
                      CarouselSlider(
                        items: advertisementImages.map((imagePath) {
                          return Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 250,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.9,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 900),
                          onPageChanged: (index, reason) {
                            setState(() {
                              _carouselIndex = index;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: advertisementImages.map((image) {
                            int index = advertisementImages.indexOf(image);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                Color.fromARGB(255, 14, 1, 1).withOpacity(
                                  index == _carouselIndex ? 0.9 : 0.4,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Latest Videos",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 115,
                        height: 150,
                        color: Colors.grey,
                        margin: EdgeInsets.all(8),
                        child: Center(
                          child: Text('Portrait Video ${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButton('Tourist Spots', Icons.place),
                      _buildButton('Garden', Icons.park),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButton('Education', Icons.school),
                      _buildButton('Offices', Icons.business),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Trending Stories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 385,
                        margin: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                    color: Color.fromARGB(255, 43, 43, 43),
                                    width: 1.0),
                                image: DecorationImage(
                                  image: AssetImage(trendingImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'This is a sample description for the post. It can be longer if needed.', // Replace with actual description
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

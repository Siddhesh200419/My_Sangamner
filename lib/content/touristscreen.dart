import 'package:flutter/material.dart';

class Touristscreen extends StatelessWidget {
  const Touristscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourist Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Sangamner',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: touristPlaces.length,
                itemBuilder: (context, index) {
                  return _buildTouristPlaceCard(context, touristPlaces[index]);
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to explore section
              },
              child: Text('Explore More'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTouristPlaceCard(BuildContext context, TouristPlace place) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeeMoreScreen(place: place),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                place.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    place.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeMoreScreen(place: place),
                            ),
                          );
                        },
                        child: Text('See More'),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // Add to favorites
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TouristPlace {
  final String name;
  final String imageUrl;
  final String description;

  TouristPlace({
    required this.name,
    required this.imageUrl,
    required this.description,
  });
}

class SeeMoreScreen extends StatelessWidget {
  final TouristPlace place;

  const SeeMoreScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Split the description into paragraphs
    List<String> paragraphs = place.description.split('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                place.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            // Display each paragraph of the description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: paragraphs
                  .map((paragraph) => Text(
                        paragraph,
                        style: TextStyle(fontSize: 16),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to location on map
              },
              child: Text('Get Location on Map'),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample tourist places data (replace with actual data)
List<TouristPlace> touristPlaces = [
  TouristPlace(
      name: 'Pemgiri Fort',
      imageUrl: 'assets/images/pem1.jpg',
      description: 'Pemagiri Fort is also known as Bhimgad or Shahgad.'
          'Pemagiri fort is not very familiar fort, but it plays an important role in the history of Maratha.'
          ' Located atop a hill, Pemgiri Fort is one of the least-explored historical places in Ahmednagar.'
          ' Even though the region of the fort is famous for Pemadevi Temple, which is the most visited spot here, and is a perfect place for trekking, it remains unexplored throughout the year.'),
  TouristPlace(
      name: 'Pemgiri Banyan Tree',
      imageUrl: 'assets/images/banyan1.jpg',
      description:
          'The largest banyan tree in the state is at Pemgiri village in Sangamner, Ahmednagar.'
          ' Meanwhile, villagers believe this tree and the deity placed under it have wish-fulfilling powers.'
          ' Villager Mangal Patil said, “Our beliefs and emotions are attached with this deity and tree.'
          ' People dont go under it wearing chappals. '),
  TouristPlace(
    name: 'Gangamai Ghat',
    imageUrl: 'assets/images/Gangamaighat1.jpg',
    description:
        'Relax and unwind at Gangamai Ghat, a serene spot along the river.\n\nGangamai Ghat is a popular riverside destination known for its peaceful atmosphere and scenic beauty. Visitors can enjoy picnics, and beautiful sunsets by the river.',
  ),
  TouristPlace(
      name: 'Chandanapuri Ghat',
      imageUrl: 'assets/images/ch1.jpg',
      description:
          'Chandanapuri Ghat is a mountain pass across the Sahyadri on Pune-Nasik National Highway. '
          'Chandanapuri village is on one end of this ghat and on the other is Ghargaon village.'
          'This ghat has some steep turns which make this ghat a difficult ghat of the Sahyadri.'),
  TouristPlace(
    name: 'Karhe Ghat',
    imageUrl: 'assets/images/karhe1.jpg',
    description:
        'Enjoy the scenic beauty of Karhe Ghat, offering breathtaking views of nature.\n\nKarhe Ghat is known for its stunning landscapes, rolling hills, and lush green valleys. Visitors can indulge in activities like trekking, birdwatching, and photography.',
  ),
  TouristPlace(
    name: 'Tamkada Waterfall',
    imageUrl: 'assets/images/Tamkada1.jpg',
    description:
        'Embark on an adventure to Tamkada Waterfall and immerse yourself in its pristine beauty.\n\nTamkada Waterfall is a hidden gem tucked away in the mountains in Chandanapui ghat, surrounded by dense forests and rocky cliffs. It\'s a perfect spot for trekking and nature lovers.',
  ),
  TouristPlace(
    name: 'Vitthal kada',
    imageUrl: 'assets/images/Vk1.jpg',
    description:
        'Explore the cultural heritage of Vitthal kada, a sacred pilgrimage site.\n\nWaterfall of vitthal kada is biggest attraction.',
  ),
  TouristPlace(
    name: 'Nizarneshwar Temple',
    imageUrl: 'assets/images/N1.jpg',
    description:
        'Experience divine peace at Nizarneshwar Temple, an ancient shrine with a rich history.\n\nNizarneshwar Temple is dedicated to Lord Shiva and is believed to have been built several centuries ago. It\'s a place of worship and meditation for devotees seeking spiritual enlightenment.',
  ),
  TouristPlace(
    name: 'Khandgaon',
    imageUrl: 'assets/images/Khandgaon1.jpg',
    description:
        'Discover the rustic charm of Khandgaon, Khandeshwar Temple, a quaint village surrounded by natural beauty.\n\nKhandgaon is a picturesque village nestled amidst lush green fields and rolling hills. Visitors can experience rural life, interact with locals, and enjoy the tranquility of nature.',
  ),
  TouristPlace(
    name: 'Ozer Dam',
    imageUrl: 'assets/images/ozerdam1.jpg',
    description:
        'Admire the engineering marvel of Ozer Dam, a man-made reservoir amidst scenic surroundings.\n\nOzer Dam is a popular picnic spot and  It offers panoramic views and recreational activities for visitors.',
  ),
  // Add more tourist places here
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
    ),
    home: Touristscreen(),
  ));
}

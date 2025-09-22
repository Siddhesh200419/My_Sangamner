import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_sangamner/content/businesscontent.dart';

class Businessscreen extends StatelessWidget
{
  const Businessscreen ({super.key});

  

  @override
  Widget build (BuildContext context)

  {
    // List For The Business Category 
      List<String> businessNames = [
      'Agri Tools',
      'Bag Shop',
      'Bakery',
      'Band & Music',
      'Battery Services',
      'Beauty Parlour',
      'Book Store',
      'Borewell',
      'Consulting',
      'C.C.T.V Shop',
      'Cafe',
      'Car Accessories',
      'Car Wash',
      'Caterer',
      'Ceramic Store',
      'Chemicals',
      'Cloths',
      'Computer Shop',
      'Cosmatic Store',
      'Crockery Shop',
      'Cycle Shop',
      'Dance & Music',
      'Decorators',
      'Driving School',
      'Electric Tools',
      'Electric Vehicles',
      'Electrical Shop',
      'Electronics Shop',
      'Event Planner',
      'Fast Food',
      'Flower Shop',
      'Flour Mill',
      'Fruit Shop',
      'Footwear',
      'Furniture',
      'Gas Agency', 
      'Gents Saloon',
      'Gents Tailor',
      'Gift Shop',
      'Grocery Store',
      'Hall & Lawn',
      'Hardware Tools',
      'Home Decoration',
      'Hotels',
      'Ice-Cream',
       'Jewellery Shop',
       'Ladies Tailor',
       'Marble Shop',
       'Medical Store',
       'Mobile Store',
       'Modular Kitchen',
       'Opticals',
       'Paan Shop',
       'Paint Shop',
       'Perfume Shop',
       'Pet Care & Shop',
       'Petrol Pump',
       'Photographer',
       'Radium Shop',
       'Restaurants',
      'Solar ',
      ' Sports Material ',
      'Sweet Store',
      'Transport ',
      'Tyre Seller',
      'Vehicle Servicing',
      'Vehicle Dealer',
      'Watch Repair', 
    ];

 List<IconData> iconsaxIcons = [
      Icons.agriculture_outlined,
      Iconsax.bag,
      Icons.bakery_dining,
      Iconsax.music,
      Iconsax.battery_full,
      Icons.face_3,
      Iconsax.book,
      Icons.water,
      Icons.handshake,
      Iconsax.camera,
      Icons.local_cafe,
      Iconsax.car,
      Icons.local_car_wash,
      Icons.dinner_dining,
      Iconsax.house,
      Icons.science, //chemicals
      Icons.shopping_bag, //cloths
      Icons.computer, //computer shop
      Icons.face, // cosmatic shop 
      Iconsax.cup,// crockery
      Icons.directions_bike, //cycle shop 
      Icons.music_note, // dance & music 
      Icons.color_lens, // Decorators
      Iconsax.driving, // Driving School
      Icons.plumbing_rounded, // Electric Power Tools
      Iconsax.car, // Electric Vehicles
      Iconsax.electricity, // Electrical Shop
      Icons.tv, // Electronics Shop
      Iconsax.calendar, // Event Planner
      Icons.food_bank, // Fast Food
      Icons.local_florist, // Flower Shop
      Icons.grain, // Flour Mill
      Icons.local_grocery_store, // Fruit Shop
      Icons.accessibility_sharp, // Footwear
      Icons.chair, // Furniture
      Iconsax.gas_station3, // Gas Agency
      Icons.person, // Gents Saloon
      Iconsax.scissor, // Gents Tailor
      Iconsax.gift, // Gift Shop
      Icons.shopping_basket, // Grocery Store
      Icons.house_outlined, // Hall & Lawn
      Icons.build, // Hardware Tools
      Icons.house, // Home Decoration
      Icons.hotel, // Hotels
      Icons.icecream_rounded, // Ice-Cream
      Icons.diamond, // Jewellery Shop
      Iconsax.scissor, // Ladies Tailor
      Iconsax.house, // Marble Shop
      Icons.medical_information, // Medical Store
      Icons.smartphone, // Mobile Store
      Icons.kitchen, // Modular Kitchen
      Iconsax.eye, // Opticals
      Icons.local_bar, // Paan Shop
      Iconsax.brush, // Paint Shop
      Icons.local_mall, // 
      Icons.pets, // Pet Care & Shop
      Icons.local_gas_station, // Petrol Pump
      Iconsax.camera, // Photographer
      Icons.art_track, // Radium Shop
      Icons.hotel, // Restaurants 
      Iconsax.sun, // Solar
      Icons.sports_basketball, // Sports Material
      Icons.food_bank_sharp, // Sweet Store
      Iconsax.truck, // Transport Services
      Icons.directions_car, // Tyre Seller
      Icons.car_repair, // Vehicle Servicing
      Iconsax.car, // Vehicle Dealer
      Iconsax.watch, // Watch Repair
      
    ];

    return Scaffold(
        appBar: AppBar(
        title: const Text('Business Hub'),
        
        
      ),
      body: Center(
        child:GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 68,
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle onTap action
            
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BusinessContent(category: businessNames[index])),
            );
              
              
            },
            child:Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 252, 214, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon( iconsaxIcons[index],
                color: const Color.fromARGB(255, 0, 0, 0),),
                  const SizedBox(height: 10),
                  Text(
                    businessNames[index], 
                    style:  TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}
      
            

    
         
    
    
  

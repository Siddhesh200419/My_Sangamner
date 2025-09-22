import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellerOnboardingScreen extends StatefulWidget {
  const SellerOnboardingScreen({Key? key}) : super(key: key);

  @override
  _SellerOnboardingScreenState createState() => _SellerOnboardingScreenState();
}

class _SellerOnboardingScreenState extends State<SellerOnboardingScreen> {
  List<String> businessCategories = [
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

  String? selectedCategory;
  TimeOfDay? openingTime;
  TimeOfDay? closingTime;
  File? selectedImage;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Onboarding'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome to Seller Onboarding!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'To start selling on our platform, please provide the following information:',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              selectedImage != null
                  ? Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(selectedImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : ElevatedButton.icon(
                      onPressed: _getImage,
                      icon: Icon(Icons.add_photo_alternate),
                      label: Text('Select Image'),
                    ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Shop Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contact Person',
                  border: OutlineInputBorder(),
                ),
              ),

                SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Shop Description',
                  border: OutlineInputBorder(),
                ),
              ),

              
                SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),


              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contact Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Business Category',
                  border: OutlineInputBorder(),
                ),
                items: businessCategories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            openingTime = time;
                          });
                        }
                      },
                      child: Text(
                        openingTime != null
                            ? 'Opening Time: ${openingTime!.format(context)}'
                            : 'Select Opening Time',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            closingTime = time;
                          });
                        }
                      },
                      child: Text(
                        closingTime != null
                            ? 'Closing Time: ${closingTime!.format(context)}'
                            : 'Select Closing Time',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Submit button logic 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Set button color to yellow
                ),
                child: Text('Submit', style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

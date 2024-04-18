import 'package:flutter/material.dart';

void main() {
  runApp(const MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Desserts'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bacc.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: DessertsScreen(),
        ),
      ),
    );
  }
}

class DessertsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> desserts = [
    {
      'title': 'Chocolate Cake',
      'image': 'assets/images/chocolate-cake.jpg',
      'ingredients': [
        '1. Granulated sugar, brown sugar and powdered',
        '2. Cocoa powder',
        '3. Baking soda',
        '4. Salt',
        '5. Boiling water',
      ],
      'instructions': [
        '1. Heat oven and prepare pans: Preheat oven to 350 degrees. Butter two 9-inch round cake pans then line bottom of each with a round of parchment paper. Butter parchment paper. Wrap cake pans with baking strips for the most level cake.',
        '2. Mix dry ingredients, then mix in boiling water: In a large, heat proof mixing bowl, whisk together granulated sugar brown sugar, cocoa powder, baking soda and salt.',
        '3. Mix in wet ingredients: Using an electric hand mixer set on low speed blend in vegetable oil and melted butter until combined. Add eggs, egg yolks and vanilla extract and blend just to combined.',
      ],
    },
    {
      'title': 'Strawberry Cheesecake',
      'image': 'assets/images/strawberrycheesecake.jpg',
      'ingredients': [
        '1. Strarwberries',
        '2. Graham crackers',
        '3. Granulated sugar',
        '4. Butter',
        '5. Cream cheese '
      ],
      'instructions': [
        '1. Blend in eggs: Mix in eggs 2 at a time, mixing just until combined after additions. Scrape down bowl.',
        '2. Add remaining: Blend in sour cream, heavy cream and vanilla just until combined. Tap bowl against countertop about 20 times to release any large air bubbles.',
        '3. Prepare pan with foil: wrap 2 layers of heavy duty aluminum foil snuggly around outside and up to the top of springform pan',
        '4. Pour filling over crust: Pour cheesecake filling over graham cracker crust, wiggle pan to level. Place cheesecake in a roasting pan large enough to fit springform pan with extra space around all sides.'
      ],
    },
  ];

  DessertsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: desserts.length,
      itemBuilder: (context, index) {
        return DessertsCard(
          title: desserts[index]['title']!,
          image: desserts[index]['image']!,
          ingredients: List<String>.from(
            desserts[index]['ingredients'] as List<dynamic>,
          ),
          instructions: List<String>.from(
            desserts[index]['instructions'] as List<dynamic>,
          ),
        );
      },
    );
  }
}

class DessertsCard extends StatelessWidget {
  final String title;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;

  const DessertsCard({
    Key? key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.instructions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipePage(
              title: title,
              image: image,
              ingredients: ingredients,
              instructions: instructions,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipePage extends StatelessWidget {
  final String title;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;

  const RecipePage({
    Key? key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.instructions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          _buildSection('Ingredients:', _buildList(ingredients)),
          _buildSection('Instructions:', _buildList(instructions)),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          content,
        ],
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Text(
          items[index],
          style: TextStyle(
              fontSize: 16.0, fontStyle: FontStyle.italic), // Change here
        );
      },
    );
  }
}

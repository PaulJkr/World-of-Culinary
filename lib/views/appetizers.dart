import 'package:flutter/material.dart';

void main() {
  runApp(const MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppetizersScreen(),
    );
  }
}

class AppetizersScreen extends StatelessWidget {
  final List<Map<String, String>> appetizers = [
    {
      'title': 'Spinach Artichoke Dip',
      'image': 'assets/images/spinach.jpg',
      'ingredients': 'Ingredient 1, Ingredient 2, Ingredient 3',
      'instructions': 'Step 1, Step 2, Step 3'
    },
    {
      'title': 'Bruschetta',
      'image': 'assets/images/bruschetta.jpg',
      'ingredients': 'Ingredient A, Ingredient B, Ingredient C',
      'instructions': 'Step A, Step B, Step C'
    },
    {
      'title': 'Stuffed Mushrooms',
      'image': 'assets/images/mushrooms.jpg',
      'ingredients': 'Ingredient X, Ingredient Y, Ingredient Z',
      'instructions': 'Step X, Step Y, Step Z'
    },
    
  ];

  AppetizersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appetizers'),
      ),
      body: ListView.builder(
        itemCount: appetizers.length,
        itemBuilder: (context, index) {
          return AppetizerCard(
            title: appetizers[index]['title']!,
            image: appetizers[index]['image']!,
            ingredients: appetizers[index]['ingredients']!,
            instructions: appetizers[index]['instructions']!,
          );
        },
      ),
    );
  }
}

class AppetizerCard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  const AppetizerCard(
      {Key? key,
      required this.title,
      required this.image,
      required this.ingredients,
      required this.instructions})
      : super(key: key);

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
  final String ingredients;
  final String instructions;

  const RecipePage(
      {Key? key,
      required this.title,
      required this.image,
      required this.ingredients,
      required this.instructions})
      : super(key: key);

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
          _buildSection('Ingredients:', ingredients),
          _buildSection('Instructions:', instructions),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
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
          const SizedBox(height: 8.0),
          Text(
            content,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

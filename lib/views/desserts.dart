import 'package:flutter/material.dart';

void main() {
  runApp(const MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DessertsScreen(),
    );
  }
}

class DessertsScreen extends StatelessWidget {
  final List<Map<String, String>> desserts = [
    {
      'title': 'Chocolate Cake',
      'image': 'assets/images/chocolate-cake.jpg',
      'ingredients': 'Ingredient A, Ingredient B, Ingredient C',
      'instructions': 'Step A, Step B, Step C',
    },
    {
      'title': 'Strawberry Cheesecake',
      'image': 'assets/images/strawberrycheesecake.jpg',
      'ingredients': 'Ingredient X, Ingredient Y, Ingredient Z',
      'instructions': 'Step X, Step Y, Step Z',
    },
  ];

  DessertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desserts'),
      ),
      body: ListView.builder(
        itemCount: desserts.length,
        itemBuilder: (context, index) {
          return DessertsCard(
            title: desserts[index]['title']!,
            image: desserts[index]['image']!,
            ingredients: desserts[index]['ingredients']!,
            instructions: desserts[index]['instructions']!,
          );
        },
      ),
    );
  }
}

class DessertsCard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  DessertsCard(
      {super.key,
      required this.title,
      required this.image,
      required this.ingredients,
      required this.instructions});

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
      {super.key,
      required this.title,
      required this.image,
      required this.ingredients,
      required this.instructions});

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

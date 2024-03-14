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
      home: SnacksScreen(),
    );
  }
}

class SnacksScreen extends StatelessWidget {
  final List<Map<String, String>> snacks = [
    {
      'title': 'Popcorn',
      'image': 'assets/images/popcorn.jpg',
      'ingredients': 'Popcorn kernels, Butter, Salt',
      'instructions': 'Pop the kernels, melt the butter, toss with salt.',
    },
    {
      'title': 'Trail Mix',
      'image': 'assets/images/trail.jpg',
      'ingredients': 'Nuts, Dried Fruit, Chocolate Chips, Pretzels',
      'instructions': 'Mix all ingredients together in a bowl.',
    },
    // Add more snack recipes
  ];

  SnacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snacks'),
      ),
      body: ListView.builder(
        itemCount: snacks.length,
        itemBuilder: (context, index) {
          return SnacksCard(
            title: snacks[index]['title']!,
            image: snacks[index]['image']!,
            ingredients: snacks[index]['ingredients']!,
            instructions: snacks[index]['instructions']!,
          );
        },
      ),
    );
  }
}

class SnacksCard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  const SnacksCard(
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

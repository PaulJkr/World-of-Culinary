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
      home: SaladsScreen(),
    );
  }
}

class SaladsScreen extends StatelessWidget {
  final List<Map<String, String>> salads = [
    {
      'title': 'Caesar Salad',
      'image': 'assets/images/caesar.jpg',
      'ingredients':
          'Romaine Lettuce, Croutons, Parmesan Cheese, Caesar Dressing',
      'instructions':
          'Toss lettuce with dressing, top with croutons and cheese.',
    },
    {
      'title': 'Greek Salad',
      'image': 'assets/images/Greek.jpg',
      'ingredients':
          'Cucumbers, Tomatoes, Red Onion, Feta Cheese, Olives, Olive Oil, Lemon Juice',
      'instructions':
          'Chop vegetables, mix with cheese and olives, dress with oil and lemon juice.',
    },
    // Add more salad recipes
  ];

  SaladsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salads'),
      ),
      body: ListView.builder(
        itemCount: salads.length,
        itemBuilder: (context, index) {
          return SaladsCard(
            title: salads[index]['title']!,
            image: salads[index]['image']!,
            ingredients: salads[index]['ingredients']!,
            instructions: salads[index]['instructions']!,
          );
        },
      ),
    );
  }
}

class SaladsCard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  const SaladsCard(
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

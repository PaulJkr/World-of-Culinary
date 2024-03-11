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
      home: DrinksScreen(),
    );
  }
}

class DrinksScreen extends StatelessWidget {
  final List<Map<String, String>> drinks = [
    {
      'title': 'Mango Smoothie',
      'image': 'assets/images/Mango-smoothie.jpg',
      'ingredients': 'Mango, Yogurt, Milk, Honey',
      'instructions': 'Blend all ingredients until smooth. Enjoy!',
    },
    {
      'title': 'Iced Coffee',
      'image': 'assets/images/iced_coffee.jpg',
      'ingredients': 'Coffee, Ice, Milk, Sugar',
      'instructions':
          'Brew coffee, let it cool, add ice and milk. Sweeten to taste.',
    },
  ];

  DrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drinks'),
      ),
      body: ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          return DrinksCard(
            title: drinks[index]['title']!,
            image: drinks[index]['image']!,
            ingredients: drinks[index]['ingredients']!,
            instructions: drinks[index]['instructions']!,
          );
        },
      ),
    );
  }
}

class DrinksCard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  const DrinksCard(
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

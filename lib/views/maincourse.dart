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
      home: MainCourseScreen(),
    );
  }
}

class MainCourseScreen extends StatelessWidget {
  final List<Map<String, String>> MainCourse = [
    {
      'title': 'Grilled Chicken',
      'image': 'assets/images/chicken.jpg',
      'ingredients': 'Chicken, Olive Oil, Salt, Pepper, Herbs',
      'instructions':
          '1. Marinate chicken\n2. Grill until cooked\n3. Serve hot',
    },
    {
      'title': 'Pasta Carbonara',
      'image': 'assets/images/pasta.jpg',
      'ingredients': 'Pasta, Eggs, Bacon, Parmesan Cheese',
      'instructions':
          '1. Cook pasta\n2. Mix eggs, bacon, and cheese\n3. Combine and serve',
    },
    {
      'title': 'Vegetarian Lasagna',
      'image': 'assets/images/lasagna.jpg',
      'ingredients':
          'Lasagna Noodles, Marinara Sauce, Vegetables, Ricotta Cheese',
      'instructions':
          '1. Layer ingredients in a baking dish\n2. Bake until bubbly\n3. Enjoy!',
    },
    // Add more main course recipes
  ];

  MainCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Course'),
      ),
      body: ListView.builder(
        itemCount: MainCourse.length,
        itemBuilder: (context, index) {
          return MainCoursecard(
            title: MainCourse[index]['title']!,
            image: MainCourse[index]['image']!,
            ingredients: MainCourse[index]['ingredients']!,
            instructions: MainCourse[index]['instructions']!,
          );
        },
      ),
    );
  }
}

class MainCoursecard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  const MainCoursecard(
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

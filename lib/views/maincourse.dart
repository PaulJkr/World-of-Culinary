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
      home: MainCourseScreen(),
    );
  }
}

class MainCourseScreen extends StatelessWidget {
  final List<Map<String, String>> mainCourse = [
    {
      'title': 'Grilled Chicken',
      'image': 'assets/images/chicken.jpg',
      'ingredients': '1. Chicken, 2. Olive Oil, 3. Salt, 4. Pepper, 5. Herbs',
      'instructions':
          '1. Marinate chicken\n2. Grill until cooked\n3. Serve hot',
    },
    {
      'title': 'Pasta Carbonara',
      'image': 'assets/images/pasta.jpg',
      'ingredients': '1. Pasta, 2. Eggs, 3. Bacon, 4. Parmesan Cheese',
      'instructions':
          '1. Cook pasta\n2. Mix eggs, bacon, and cheese\n3. Combine and serve',
    },
    {
      'title': 'Vegetarian Lasagna',
      'image': 'assets/images/lasagna.jpg',
      'ingredients':
          '1. Lasagna Noodles, 2. Marinara Sauce, 3. Vegetables, 4. Ricotta Cheese',
      'instructions':
          '1. Layer ingredients in a baking dish\n2. Bake until bubbly\n3. Enjoy!',
    },
    // Add more main course recipes
  ];

  MainCourseScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Course'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bacc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: mainCourse.length,
          itemBuilder: (context, index) {
            return MainCourseCard(
              title: mainCourse[index]['title']!,
              image: mainCourse[index]['image']!,
              ingredients: mainCourse[index]['ingredients']!,
              instructions: mainCourse[index]['instructions']!,
            );
          },
        ),
      ),
    );
  }
}

class MainCourseCard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  const MainCourseCard({
    Key? key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

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

  const RecipePage({
    Key? key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    List<String> ingredientList = ingredients.split(', ');
    List<String> instructionList = instructions.split('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bacc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            _buildSection('Ingredients:', _formatList(ingredientList)),
            _buildSection('Instructions:', _formatList(instructionList)),
          ],
        ),
      ),
    );
  }

  static List<Widget> _formatList(List<String> items) {
    return items
        .map(
          (item) => Text(
            item.trim(),
            style: const TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
        .toList();
  }

  Widget _buildSection(String title, List<Widget> contentList) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contentList,
          ),
        ],
      ),
    );
  }
}

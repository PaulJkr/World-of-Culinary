import 'package:flutter/material.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesCatalog(),
    );
  }
}

class CategoriesCatalog extends StatelessWidget {
  final List<String> categories = [
    'Appetizers',
    'Main Course',
    'Desserts',
    'Drinks',
    'Salads',
    'Snacks',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryTile(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String category;

  CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          category,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // TODO: Navigate to a screen displaying recipes for the selected category
          // You can use Navigator.push to navigate to a new screen
          // and pass the selected category as a parameter
          print('Selected category: $category');
        },
      ),
    );
  }
}

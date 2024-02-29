import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    RecipeList(),
    Favorites(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Recipe App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the home screen or perform any action
              },
            ),
            ListTile(
              title: Text('Categories'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the categories screen or perform any action
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the settings screen or perform any action
              },
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Recipe List'),
    );
  }
}

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites'),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile'),
    );
  }
}

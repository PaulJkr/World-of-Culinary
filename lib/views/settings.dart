import 'package:flutter/material.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notification Preferences'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationPreferencesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Account Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccountSettingsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Theme Preferences'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ThemePreferencesScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationPreferencesScreen extends StatefulWidget {
  @override
  _NotificationPreferencesScreenState createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends State<NotificationPreferencesScreen> {
  bool receiveRecipeNotifications = true;
  bool receiveNewsletters = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Preferences'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Receive Recipe Notifications'),
            value: receiveRecipeNotifications,
            onChanged: (bool value) {
              setState(() {
                receiveRecipeNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Receive Newsletters'),
            value: receiveNewsletters,
            onChanged: (bool value) {
              setState(() {
                receiveNewsletters = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              // Navigate to Change Password screen
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Perform logout action
            },
          ),
        ],
      ),
    );
  }
}

class ThemePreferencesScreen extends StatefulWidget {
  @override
  _ThemePreferencesScreenState createState() => _ThemePreferencesScreenState();
}

class _ThemePreferencesScreenState extends State<ThemePreferencesScreen> {
  String selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Preferences'),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            title: Text('Light Theme'),
            value: 'light',
            groupValue: selectedTheme,
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  selectedTheme = value;
                });
              }
            },
          ),
          RadioListTile<String>(
            title: Text('Dark Theme'),
            value: 'dark',
            groupValue: selectedTheme,
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  selectedTheme = value;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

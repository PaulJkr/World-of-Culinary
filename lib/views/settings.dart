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
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notification Preferences'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPreferencesScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Account Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Theme Preferences'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThemePreferencesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({Key? key}) : super(key: key);

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
        title: const Text('Notification Preferences'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Receive Recipe Notifications'),
            value: receiveRecipeNotifications,
            onChanged: (bool value) {
              setState(() {
                receiveRecipeNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Receive Newsletters'),
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
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Change Password'),
            onTap: () {
              // Navigate to Change Password screen
            },
          ),
          ListTile(
            title: const Text('Logout'),
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
  const ThemePreferencesScreen({Key? key}) : super(key: key);

  @override
  _ThemePreferencesScreenState createState() => _ThemePreferencesScreenState();
}

class _ThemePreferencesScreenState extends State<ThemePreferencesScreen> {
  String selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Preferences'),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            title: const Text('Light Theme'),
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
            title: const Text('Dark Theme'),
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

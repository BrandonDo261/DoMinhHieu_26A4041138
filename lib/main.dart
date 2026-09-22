import 'package:flutter/material.dart';
import 'exercise 1.dart';
import 'exercise 2.dart';
import 'exercise 3.dart';
import 'exercise 4.dart';
import 'exercise 5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Biến quản lý trạng thái Dark Mode cho Exercise 4
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Flutter UI',
      // Áp dụng ThemeData dựa trên trạng thái isDarkMode
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(
        onThemeChanged: toggleTheme,
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuButton(context, 'Exercise 1 – Core Widgets Demo', const Exercise1Screen()),
          _buildMenuButton(context, 'Exercise 2 – Input Controls Demo', const Exercise2Screen()),
          _buildMenuButton(context, 'Exercise 3 – Layout Demo', Exercise3Screen()),
          _buildMenuButton(context, 'Exercise 4 – App Structure & Theme', Exercise4Screen(
            isDarkMode: isDarkMode,
            onThemeChanged: onThemeChanged,
          )),
          _buildMenuButton(context, 'Exercise 5 – Common UI Fixes', const Exercise5Screen()),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget screen) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}

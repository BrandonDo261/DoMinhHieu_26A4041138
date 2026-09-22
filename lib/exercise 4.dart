import 'package:flutter/material.dart';

class Exercise4Screen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const Exercise4Screen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          Row(
            children: [
              const Text('Dark'),
              // Switch toggle Dark Mode gọi callback thay đổi Theme[span_7](start_span)[span_7](end_span)
              Switch(
                value: isDarkMode,
                onChanged: onThemeChanged,
              ),
            ],
          ),
        ],
      ),
      // Body
      body: const Center(
        child: Text('This is a simple screen with theme toggle.'),
      ),
      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FAB Clicked!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

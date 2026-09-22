import 'package:flutter/material.dart';

class Exercise1Screen extends StatelessWidget {
  const Exercise1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Headline Text
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            // 2. Icon bằng Material Icons
            const Center(
              child: Icon(Icons.movie, size: 80, color: Colors.blue),
            ),
            const SizedBox(height: 24),
            // 3. Image.network
            Image.network(
              'https://picsum.photos/400/200', // Hình ảnh ngẫu nhiên hợp lệ
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            // 4. Card chứa ListTile
            const Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

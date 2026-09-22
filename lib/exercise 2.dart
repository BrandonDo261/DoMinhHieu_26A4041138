import 'package:flutter/material.dart';

class Exercise2Screen extends StatefulWidget {
  const Exercise2Screen({super.key});

  @override
  State<Exercise2Screen> createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  double _rating = 50.0;
  bool _isActive = false;
  String _selectedGenre = 'None';
  DateTime? _selectedDate;

  // Hàm hiển thị DatePicker
  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Slider
            const Text('Rating (Slider)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Slider(
              value: _rating,
              min: 0,
              max: 100,
              onChanged: (val) => setState(() => _rating = val),
            ),
            Text('Current value: ${_rating.toInt()}'),
            const SizedBox(height: 24),

            // 2. Switch
            const Text('Active (Switch)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text('Is movie active?'),
              value: _isActive,
              onChanged: (val) => setState(() => _isActive = val),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 24),

            // 3. RadioListTile
            const Text('Genre (RadioListTile)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (val) => setState(() => _selectedGenre = val!),
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (val) => setState(() => _selectedGenre = val!),
            ),
            Text('Selected genre: $_selectedGenre'),
            const SizedBox(height: 24),

            // 4. DatePicker Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _pickDate,
                child: const Text('Open Date Picker'),
              ),
            ),
            if (_selectedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Selected date: ${_selectedDate.toString().split(' ')[0]}'),
              ),
          ],
        ),
      ),
    );
  }
}

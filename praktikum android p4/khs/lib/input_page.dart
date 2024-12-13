import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final List<String> grades = ['A', 'B', 'C', 'D', 'E']; // Nilai valid
  final List<String> selectedGrades = List.filled(12, 'A'); // Nilai default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Nilai Mata Kuliah'),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedGrades[index],
              onChanged: (value) {
                setState(() {
                  selectedGrades[index] = value!;
                });
              },
              items: grades.map((grade) {
                return DropdownMenuItem(
                  value: grade,
                  child: Text(grade),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Mata Kuliah ${index + 1}',
                border: const OutlineInputBorder(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(grades: selectedGrades),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

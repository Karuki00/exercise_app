import 'package:flutter/material.dart';
import 'exercise_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercise App')),
      body: Center(
        child: ElevatedButton(
          child: Text("View Exercises"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ExerciseListPage()),
            );
          },
        ),
      ),
    );
  }
}

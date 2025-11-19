import 'package:exercise_app/services/api_service.dart';
import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Exercise exercise;

  ExerciseDetailPage({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(exercise.imageUrl, headers: ApiService.headers),

            SizedBox(height: 20),
            Text(
              "Body Part: ${exercise.bodyPart}",
              style: TextStyle(fontSize: 18),
            ),
            Text("Target: ${exercise.target}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

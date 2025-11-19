import 'package:exercise_app/services/api_service.dart';
import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../pages/exercise_detail_page.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          exercise.imageUrl,
          width: 70,
          height: 70,
          headers: ApiService.headers, // IMPORTANT
        ),
        title: Text(exercise.name),
        subtitle: Text(exercise.target),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExerciseDetailPage(exercise: exercise),
            ),
          );
        },
      ),
    );
  }
}

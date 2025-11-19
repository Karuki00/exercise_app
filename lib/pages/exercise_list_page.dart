import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/exercise_card.dart';
import '../models/exercise.dart';

class ExerciseListPage extends StatefulWidget {
  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  late Future<List<Exercise>> exercises;

  @override
  void initState() {
    super.initState();
    exercises = ApiService.getExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercises")),
      body: FutureBuilder(
        future: exercises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading exercises"));
          }

          final list = snapshot.data as List<Exercise>;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ExerciseCard(exercise: list[index]);
            },
          );
        },
      ),
    );
  }
}

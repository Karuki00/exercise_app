import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exercise.dart';

class ApiService {
  static const String baseUrl = "https://exercisedb.p.rapidapi.com/exercises";

  static const Map<String, String> headers = {
    "X-RapidAPI-Key": "YOUR-API-KEY",
    "X-RapidAPI-Host": "exercisedb.p.rapidapi.com",
  };

  static Future<List<Exercise>> getExercises() async {
    final response = await http.get(Uri.parse(baseUrl), headers: headers);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Exercise.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch exercises");
    }
  }
}

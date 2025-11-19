class Exercise {
  final String id;
  final String name;
  final String bodyPart;
  final String target;

  Exercise({
    required this.id,
    required this.name,
    required this.bodyPart,
    required this.target,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      bodyPart: json['bodyPart'] ?? "",
      target: json['target'] ?? "",
    );
  }

  String get imageUrl =>
      "https://exercisedb.p.rapidapi.com/image?exerciseId=$id&resolution=180";
}

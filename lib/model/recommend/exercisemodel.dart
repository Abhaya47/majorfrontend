class ExercisePost {
  final List<int> durations;
  final List<String> exerciseNames;

  ExercisePost({
    required this.durations,
    required this.exerciseNames,
  });

  factory ExercisePost.fromJson(Map<String, dynamic> json) {
    return ExercisePost(
      durations: [
        json['Duration'] as int,
        json['Duration_2'] as int,
        json['Duration_3'] as int,
      ],
      exerciseNames: [
        json['Exercise_Name'] as String,
        json['Exercise_Name_2'] as String,
        json['Exercise_Name_3'] as String,
      ],
    );
  }
}
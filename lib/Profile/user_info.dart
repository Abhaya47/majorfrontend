class InfoPosts{
  final double height;
  final int weight;
  final int pressure;
  final int sugar;
  final int age;
  final String? gender;

  InfoPosts({
    required this.height,
    required this.weight,
    required this.pressure,
    required this.sugar,
    required this.age,
    required this.gender,
  });
  factory InfoPosts.fromJson(Map<String, dynamic> json){
    InfoPosts feature= InfoPosts(
        height: json["height"] as double,
        weight: json["weight"] as int,
        pressure: json["pressure"] as int,
        sugar: json["sugar"] as int,
        age: json["age"] as int,
        gender: json["gender"] as String?);
    return feature;
  }

}
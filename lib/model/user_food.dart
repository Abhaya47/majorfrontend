class FoodPost{
  final int id;
  final String name;
  final int calorie;
  final String? description;
  final int count;

  FoodPost({
    required this.id,
    required this.name,
    required this.calorie,
    required this.description,
    required this.count,
  });
  factory FoodPost.fromJson(Map<String, dynamic> json){
    FoodPost food =  FoodPost(
      id: json['id'] as int,
      name: json['name'] as String,
      calorie: json['calorie'] as int,
      description: json['description'] as String?,
      count: json['count'] as int,
    );
    return food;
  }
}
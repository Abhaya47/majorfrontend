class RecFood {
  final String name;
  final double calories;
  final double fatContent;
  final double cholesterolContent;
  final double sodiumContent;
  final double carbohydrateContent;
  final double sugarContent;
  final double proteinContent;
  final String type;

  RecFood({
    required this.name,
    required this.calories,
    required this.fatContent,
    required this.cholesterolContent,
    required this.sodiumContent,
    required this.carbohydrateContent,
    required this.sugarContent,
    required this.proteinContent,
    required this.type,
  });

  factory RecFood.fromJson(Map<String, dynamic> json) {
    RecFood feature= RecFood(
      name: json['Name'] as String,
      calories: json['Calories'] as double,
      fatContent: json['FatContent'] as double,
      cholesterolContent: json['CholesterolContent'] as double,
      sodiumContent: json['SodiumContent'] as double,
      carbohydrateContent: json['CarbohydrateContent'] as double,
      sugarContent: json['SugarContent'] as double,
      proteinContent: json['ProteinContent'] as double,
      type: json['Type'] as String,
    );
    return feature;
  }
}
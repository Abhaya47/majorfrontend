class MyInfo{
  // final String fullname;
  final double ?height;
  final int weight;
  final int pressure;

  MyInfo({
    // required this.fullname,
    required this.height,
    required this.weight,
    required this.pressure,
  });
  factory MyInfo.fromJson(Map<String, dynamic> json){
    MyInfo ufeature =  MyInfo(
      // fullname: json['fullname'] as String,
      height: json['height'] as double,
      weight: json['weight'] as int,
      pressure: json['pressure'] as int,
    );
    return ufeature;
  }

}
class UserModel {
  String name;
  String email;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        password: json['password']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
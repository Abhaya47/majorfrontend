import 'dart:convert';
import 'package:http/http.dart';

import 'globals.dart';

class Login{

  static Future<Response> login(String email,String password) async {
    final String url = ("http://localhost/api/login");

    Map data={
        "email": email,
        "password": password
      };
      var body=jsonEncode(data);
      Response response=await post(
          Uri.parse(url),
          headers: headers,
          body: body
      );
      print(response.body);
      return (response);
  }
}
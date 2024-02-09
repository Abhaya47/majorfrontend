import 'dart:convert';
import 'package:http/http.dart';

import 'globals.dart';

class Register{
  final String url = ("http://localhost/api/register");

  Future<Response> register(String name, String email,String password) async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data={
        "name": name,
        "email": email,
        "password": password
      };
      var body=jsonEncode(data);
      Response response=await post(
        Uri.parse(url),
        headers: headers,
        body: body
      );
      return (response);
    }
    else {
      return(response);
    }
  }
}
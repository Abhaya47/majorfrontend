import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart';
import 'package:majorproject/Profile/user_info.dart';
import 'package:majorproject/model/user_food.dart';

class api {

  static Authentication(Map<String, String> headers) async{
    final storage = new FlutterSecureStorage();
    String ?token=await storage.read(key: 'token');
    if(token==null){
      return headers;
    }
    if (token != "") {
      token = "Bearer "+token!;

      headers['Authorization'] = token;
    }
    return headers;
  }

  /**
   * URL String
   * Body JSON String
   * Headers array
   */
  static Post(String url, String body) async {
    /*
    Check if logged in
     */
    //write the response of /login to a file
    //read the file and get the token
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    headers=await Authentication(headers);

    Response response = await post(
        Uri.parse(url),
        headers: headers,
        body: body
    );
    // print(response.body);
    return (response);
  }

  static Put(String url, String body) async {
    /*
    Check if logged in
     */
    //write the response of /login to a file
    //read the file and get the token
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Authentication(headers);

    Response response = await put(
        Uri.parse(url),
        headers: headers,
        body: body
    );
    // print(response.body);
    return (response);
  }

  /**
   * URL String
   * Body JSON String
   * Headers array
   */
  static Get(String url) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    headers=await Authentication(headers);
    Response response = await get(
      Uri.parse(url),
      headers: headers,
    );
    return response;
  }

  Future<List<FoodPost>> GetFood(String url)
  async {
     Response response = await Get(url);
     if(response.statusCode == 200)
       {
         List<dynamic> body=jsonDecode(response.body);

         List<FoodPost> posts= body
             .map(
             (dynamic item)=>FoodPost.fromJson(item),
         ).toList();
         return posts;
       }
        else{
          throw "Unable to retrieve post";
     }
  }
  Future<List<MyInfo>> Getufeature(String url)
  async {
    Response response = await Get(url);

    if(response.statusCode == 200)
    {
      List<dynamic> body=jsonDecode(response.body);
  print(response.body);
      List<MyInfo> posts= body
          .map(
            (dynamic item)=>MyInfo.fromJson(item),
      ).toList();
      return posts;

    }

    else{
      throw "Unable to retrieve data";
    }
  }
}
